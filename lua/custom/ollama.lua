local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function ask_ollama()
    vim.ui.input({ prompt = "Ask Ollama: " }, function(question)
        if not question or question == "" then
            print("No question entered.")
            return
        end
	local ip = "127.0.0.1"  -- Replace with your Ollama server IP
	local port = "11434"         -- Make sure this is correct
    	local model = "deepseek-r1" -- The model you want to use

    	local url = "http://" .. ip .. ":" .. port .. "/api/generate"
    	local cmd = 'curl -s -X POST "' .. url .. '" -H "Content-Type: application/json" -d \'{"model": "'.. model ..'", "prompt": "' .. question .. '"}\''

        local handle = io.popen(cmd)
        if not handle then
            print("Failed to run Ollama.")
            return
        end

        local result = handle:read("*a")
        handle:close()

         -- Try to parse the result as JSON
        local success, parsed_result = pcall(vim.fn.json_decode, result)
        if success then
            -- Transform the JSON into human-readable format
            local human_readable = ""
            for key, value in pairs(parsed_result) do
                human_readable = human_readable .. key .. ": " .. tostring(value) .. "\n"
            end
            result = human_readable
        else
            print("Failed to parse JSON response.")
        end

        -- Create a Telescope picker to display the result
        pickers.new({}, {
            prompt_title = "Ollama Response",
            finder = finders.new_table({ results = { result } }),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(_, map)
                map("i", "<CR>", actions.close)
                return true
            end,
        }):find()
    end)
end

vim.api.nvim_create_user_command("OllamaTelescope", ask_ollama, {})
