local M = {}

local function isInFileBuffer()
    local isFileBuffer = vim.bo.buftype == ''
    local hasFilePath = vim.fn.bufname() ~= ''
    return isFileBuffer and hasFilePath
end

-- Improved function to handle file buffer and quickfix list actions
function M.MyAsyncRunStop()
    if isInFileBuffer() then
        -- Your code for handling file buffers
        vim.api.nvim_command('w')
    end


    local qflist = vim.fn.getqflist()
    if #qflist <= 4 then
        if isInFileBuffer() then
            vim.api.nvim_command('e')
        end
    else
        vim.api.nvim_command('copen')
        vim.api.nvim_command('cc')
        if isInFileBuffer() then
            vim.api.nvim_command('e')
        end
    end
end

-- Function for Git mediateo
function M.GitMediate()
    -- Using nvim_create_autocmd for more idiomatic event handling
    vim.api.nvim_create_autocmd('User', {
        pattern = 'AsyncRunStop',
        callback = function()
            require('git-mediate').MyAsyncRunStop()
        end,
    })

    -- Directly using the Lua API for command execution
    vim.api.nvim_command('AsyncRun! git mediate -d')
end

-- Setup function to create user command
function M.setup()
    -- Using nvim_create_user_command for better API usage
    vim.api.nvim_create_user_command('GitMediate', M.GitMediate, {})
end

return M
