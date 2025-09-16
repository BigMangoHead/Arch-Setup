
-- Largely courtesy of ChatGPT

local autosave_enabled = vim.g.autosave_default or false -- Default from global variable
local autosave_timer = nil
local autosave_interval = 3000; -- Milliseconds between autosaves

-- Function to start autosaving
local function start_autosave(interval)
    if autosave_timer then return end -- Prevent multiple timers
    autosave_timer = vim.loop.new_timer()
    autosave_timer:start(0, interval, vim.schedule_wrap(function()
        if vim.bo.modified and vim.bo.filetype ~= '' then
            vim.cmd('silent! write')
        end
    end))
end

-- Function to stop autosaving
local function stop_autosave()
    if autosave_timer then
        autosave_timer:stop()
        autosave_timer:close()
        autosave_timer = nil
    end
end

-- Command to toggle autosave
vim.api.nvim_create_user_command('ToggleAutosave', function()
    if autosave_enabled then
        stop_autosave()
        autosave_enabled = false
        print("Autosave Disabled")
    else
        start_autosave(autosave_interval) -- Autosave every 1000ms (1 second)
        autosave_enabled = true
        print("Autosave Enabled")
    end
end, {})

-- Keymap for toggling autosave globally
vim.keymap.set('n', '<leader>as', ':ToggleAutosave<CR>', { noremap = true, silent = true })

-- Automatically start/stop autosaving based on the default state
if autosave_enabled then
    start_autosave(autosave_interval);
end
