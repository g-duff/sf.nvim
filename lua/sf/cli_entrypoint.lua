local M = {}

vim.api.nvim_create_user_command('SF', function (opts)
	-- vim.system("sf"..opts.args, { text = true }):wait()
	local cmd = {'sf'}

	for _, value in pairs(opts.fargs) do
		table.insert(cmd, value)
	end

	local result = vim.fn.system(cmd)
	vim.notify(result, {vim.log.levels.INFO}, {})
end, { nargs = "+" })

vim.api.nvim_create_user_command('SFInsertDefaultScratchOrgUser', function(opts)
	local cmd = {'sf', 'org', 'list', '--json'}

	local raw_output = vim.fn.system(cmd)

	local result = vim.json.decode(raw_output)
	local scratch_orgs = result['result']['scratchOrgs']

	local scratch_org_username = ''
	for scratch_org in scratch_orgs do
		if scratch_org["isDefaultDevHubUsername"] == true then
			scratch_org_username = scratch_org['username']
		end
	end

	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { scratch_org_username })
end, {nargs = 0 })

return M



