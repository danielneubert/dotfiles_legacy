local cmp_ok, cmp = pcall(require, "cmp")
local cmp_pairs_ok, cmp_pairs = pcall(require, "nvim-autopairs.completion.cmp")
local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")

if not cmp_ok or not cmp_pairs_ok or not autopairs_ok then
	return
end

autopairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string" }, -- it will not add pair on that treesitter node
		javascript = { "template_string" },
		java = false, -- don't check treesitter on java
	},
})

cmp.event:on("confirm_done", cmp_pairs.on_confirm_done({ map_char = { tex = "" } }))
