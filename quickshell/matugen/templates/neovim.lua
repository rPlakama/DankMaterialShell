return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '{{dank16.color0.default.hex}}',
				base01 = '{{dank16.color8.default.hex}}',
				base02 = '{{dank16.color0.default.hex}}',
				base03 = '{{dank16.color8.default.hex}}',
				base04 = '{{dank16.color7.default.hex}}',
				base05 = '{{dank16.color7.default.hex}}',
				base06 = '{{dank16.color15.default.hex}}',
				base07 = '{{dank16.color15.default.hex}}',
				base08 = '{{dank16.color1.default.hex}}',
				base09 = '{{dank16.color9.default.hex}}',
				base0A = '{{dank16.color3.default.hex}}',
				base0B = '{{dank16.color2.default.hex}}',
				base0C = '{{dank16.color6.default.hex}}',
				base0D = '{{dank16.color4.default.hex}}',
				base0E = '{{dank16.color5.default.hex}}',
				base0F = '{{dank16.color13.default.hex}}',
			})

			local function set_hl_mutliple(groups, value)
				for _, v in pairs(groups) do vim.api.nvim_set_hl(0, v, value) end
			end

			vim.api.nvim_set_hl(0, 'Visual',
				{ bg = '{{dank16.color4.default.hex}}', fg = '{{dank16.color0.default.hex}}', bold = true })
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '{{dank16.color8.default.hex}}' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '{{dank16.color12.default.hex}}', bold = true })

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"

			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()

				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)

					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("󰂖 Matugen: Colors reloaded!")
					end
				end))
			end
		end
	}
}
