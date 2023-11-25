local cmp = require('cmp')


cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-y>'] = cmp.mapping.confirm({select = true}),
		['<Tab>'] = cmp.mapping.abort(),
	})
})

-- cmp.setup({
-- 	sources = {
-- 	{name = 'nvim_lsp'},
--   },
--   mapping = {
--     ['<C-y>'] = cmp.mapping.confirm({select = false}),
--     ['<Tab>'] = cmp.mapping.abort(),
--     ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
--     ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
--     ['<C-p>'] = cmp.mapping(function()
--       if cmp.visible() then
--         cmp.select_prev_item({behavior = 'insert'})
--       else
--         cmp.complete()
--       end
--     end),
--     ['<C-n>'] = cmp.mapping(function()
--       if cmp.visible() then
--         cmp.select_next_item({behavior = 'insert'})
--       else
--         cmp.complete()
--       end
--     end),
--   },
--   snippet = {
--     expand = function(args)
--       require('luasnip').lsp_expand(args.body)
--     end,
--   },
-- })
