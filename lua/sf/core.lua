local module = {}

function module.sf_sync(sf_command_and_args)
	local cmd = {'sf'}

	for _, value in pairs(sf_command_and_args) do
		table.insert(cmd, value)
	end

	return vim.fn.system(cmd)
end

return module
