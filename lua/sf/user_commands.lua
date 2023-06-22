local M = {}

local core = require('sf.core')

vim.api.nvim_create_user_command('SF', function (opts)
	result = core.sf_sync(opts.fargs)
	vim.notify(result, {vim.log.levels.INFO}, {})
end, { nargs = "+" })

return M
