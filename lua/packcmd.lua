vim.api.nvim_create_user_command("Pack", function(opts)
    local action = opts.fargs[1]
    local target = opts.fargs[2]

    if action == "update" then
        vim.pack.update(target) -- Updates all if target is nil
        print(target and ("Updating " .. target) or "Updating all plugins...")
    elseif action == "del" or action == "delete" then
        if target then
            vim.pack.del({target})
            print("Deleted: " .. target)
        else
            print("Error: Please specify a plugin name to delete.")
        end
    else
        print("Usage: :Pack update [name] | :Pack del [name]")
    end
end, {
    nargs = '+',
    complete = function(ArgLead, CmdLine, CursorPos)
        local args = vim.split(CmdLine, "%s+")
        if #args <= 2 then
            return vim.tbl_filter(function(s) return s:find(ArgLead) end, { "update", "del" })
        end
    end
})
