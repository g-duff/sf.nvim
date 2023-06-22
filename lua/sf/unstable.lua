local M = {}

local core = require('sf.core')

vim.api.nvim_create_user_command('SFInsertJson', function (opts)
	local raw_result = core.sf_sync_json(opts.fargs)

	local json_lines = {}
	for line in raw_result:gmatch("[^\r\n]+") do
		table.insert(json_lines, line);
	end

	local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_buf_set_lines(0, row-1, row-1, false, json_lines)
end, { nargs = "+" })

vim.api.nvim_create_user_command('SFPrintScratchOrgDefaultUsername', function ()

	local result = core.sf_sync_table({'org', 'list'})

	local scratch_orgs = result['result']['scratchOrgs']

	local scratch_org_username = ''
	for _, scratch_org in pairs(scratch_orgs) do
		if scratch_org["isDefaultUsername"] == true then
			scratch_org_username = scratch_org['username']
		end
	end

	vim.notify(scratch_org_username, {vim.log.levels.INFO}, {})
end, { nargs = 0 })

return M
