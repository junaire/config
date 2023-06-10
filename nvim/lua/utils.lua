local M = {}

function M.map(modes, lhs, rhs, opts)
	opts = opts or {}
	if type(modes) == 'string' then
		modes = { modes }
	end
	for _, mode in ipairs(modes) do
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

return M

