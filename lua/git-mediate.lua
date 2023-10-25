M = {}
function M.HasErrorsInQuickfix()
    local quickfixList = vim.fn.getqflist()

    for _, entry in ipairs(quickfixList) do
        if entry.type == "E" or entry.type == "error" then
            return true -- There are errors in the quickfix list
        end
    end

    return false -- No errors found in the quickfix list
end

function M.MyAsyncRunStop()
    -- 4 lines on no conflicts
    if #vim.fn.getqflist() <= 4 then
        print("No conflicts")
        vim.cmd("Conflict3Clear")
        vim.cmd("cclose")
        vim.diagnostic.enable()
        vim.cmd(":e!")
    else
        print("Found conflicts!")
        vim.diagnostic.disable()
        vim.cmd("copen")
        vim.cmd("cc 4")
        vim.cmd("Conflict3Highlight")
    end
end

function M.GitMediate()
    vim.cmd("autocmd User AsyncRunStop lua M.MyAsyncRunStop()")
    vim.cmd("AsyncRun git mediate -d")
end

function M.setup()
    vim.api.nvim_create_user_command('GitMediate', M.GitMediate, {})
end

return M
