local M = {}

vim.api.nvim_create_user_command('SF', function (opts)
	-- vim.system("sf"..opts.args, { text = true }):wait()
	local cmd = {'sf'}

	for _, value in pairs(opts.fargs) do
		table.insert(cmd, value)
	end

	local result = vim.fn.system(cmd)
	print(result)
end, { nargs = "+" })
return M

