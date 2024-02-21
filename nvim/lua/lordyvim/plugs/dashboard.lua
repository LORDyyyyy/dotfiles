local ok, dashboard = pcall(require, "dashboard")
if not ok then
	return
end

dashboard.hide_statusline = false
dashboard.hide_tabline = true
dashboard.hide_winbar = true

-- dashboard.custom_header = {
--   ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
--   ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
--   ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
--   ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
--   ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
--   ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
-- }

dashboard.custom_header = {
	" █████          ███████   ███████████  ██████████             ",
	"░░███         ███░░░░░███░░███░░░░░███░░███░░░░███            ",
	" ░███        ███     ░░███░███    ░███ ░███   ░░███ █████ ████",
	" ░███       ░███      ░███░██████████  ░███    ░███░░███ ░███ ",
	" ░███       ░███      ░███░███░░░░░███ ░███    ░███ ░███ ░███ ",
	" ░███      █░░███     ███ ░███    ░███ ░███    ███  ░███ ░███ ",
	" ███████████ ░░░███████░  █████   ███████████████   ░░███████ ",
	"░░░░░░░░░░░    ░░░░░░░   ░░░░░   ░░░░░░░░░░░░░░░     ░░░░░███ ",
	"                                                     ███ ░███ ",
	"                                                    ░░██████  ",
	"                                                     ░░░░░░   "
}

dashboard.custom_center = {
	{
		icon = '  ',
		desc = 'Recent Files                            ',
		action = 'Telescope oldfiles',
		shortcut = 'SPC d  '
	},
	{
		icon = '󰉋  ',
		desc = 'File Browser                            ',
		action = 'Neotree float',
		shortcut = 'SPC s  '
	},
	{
		icon = '  ',
		desc = 'Find File                               ',
		action = 'Telescope find_files',
		shortcut = 'SPC f  '
	},
	{
		icon = '  ',
		desc = 'New File                                ',
		action = 'DashboardNewFile',
		shortcut = 'SPC b n'
	},
	{
		icon = '  ',
		desc = 'Terminal                                ',
		action = 'lua require("nvterm.terminal").toggle "float"',
		shortcut = 'SPC t t'
	},
	{
		icon = '  ',
		desc = 'Update Plugins                          ',
		action = 'PackerUpdate',
		shortcut = '       '
	},
	{
		icon = '  ',
		desc = 'Change Themes                           ',
		action = 'Telescope colorscheme',
		shortcut = '       '
	},
	{
		icon = '  ',
		desc = 'Load Sessions                           ',
		action = 'SessionManager load_session',
		shortcut = '       '
	},
    {
		icon = '󱕗  ',
		desc = 'Delete Sessions                         ',
		action = 'SessionManager delete_session',
		shortcut = '       '
	},
    {
		icon = '󰿅  ',
		desc = 'Exit                                    ',
		action = 'q',
		shortcut = '       '
	}

}



local function get_footer()
	local default_footer = { '', 'Good evening LORDy, Welcome to  !' }
	if packer_plugins ~= nil then
		local count = #vim.tbl_keys(packer_plugins)
		default_footer[2] = 'Loaded ' .. count .. ' plugins'
	end
	return default_footer
end

dashboard.custom_footer = get_footer()

local function get_header_pad()
	local header_height = #dashboard.custom_header
	local center_height = (#dashboard.custom_center * 2) + dashboard.center_pad

	local footer_height = 2 + dashboard.footer_pad
	if dashboard.custom_footer ~= nil then
		footer_height = #dashboard.custom_footer + dashboard.footer_pad
	end

	local dashboard_height = header_height + center_height + footer_height

	local win_height = vim.fn.winheight(0)
	local padding = (win_height - dashboard_height) / 2
	return padding
end

dashboard.header_pad = get_header_pad()


-- Highligh groups
local ok, dracula = pcall(require, "dracula")
if ok then
	local colors = dracula.colors()
	vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = "#BD93f9" })
	vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, 'DashboardShortCut', { fg = colors.cyan })
	vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = "#BD93f9" })
	for i in ipairs(dashboard.custom_center) do
		dashboard.custom_center[i].icon_hl = { fg = colors.cyan }
	end
end
