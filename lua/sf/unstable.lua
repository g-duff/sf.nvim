local M = {}

local core = require('sf.core')

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