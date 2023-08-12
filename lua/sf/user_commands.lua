local M = {}

local core = require('sf.core')

vim.api.nvim_create_user_command('SF', function (opts)
	result = core.sf_sync(opts.fargs)
	local formatted_result = {}
	for line in result:gmatch("[^\r\n]+") do
		table.insert(formatted_result, line);
	end

	output_buffer_handle = vim.api.nvim_create_buf(true, true)
	vim.api.nvim_open_win(output_buffer_handle, true, {
		relative='editor',
		width=102,
		height=9,
		row=10,
		col=10,
		border='rounded'
	})
	vim.opt_local.number = false
	vim.opt_local.relativenumber = false
	vim.api.nvim_buf_set_lines(output_buffer_handle, 0, 0, false, formatted_result)

end, { nargs = "+" })

return M
