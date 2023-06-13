local module = {}

function module.sf_sync(sf_command_and_args)
	local cmd = {'sf'}

	for _, value in pairs(sf_command_and_args) do
		table.insert(cmd, value)
	end

	return vim.fn.system(cmd)
end

function module.sf_sync_table(sf_command_and_args)
	local cmd = {'sf'}

	sf_command_and_args[#sf_command_and_args + 1] = '--json'

	raw_output = module.sf_sync(sf_command_and_args)

	return vim.json.decode(raw_output)
end

return module
