local wezterm = require 'wezterm'

local M = {
    keys = {
        -- Make Page up/down work
    	{ key = 'PageUp', action = wezterm.action.ScrollByPage(-1) },
    	{ key = 'PageDown', action = wezterm.action.ScrollByPage(1) },
    
    	-- Pane splitting
    	{
    		key = 'd',
    		mods = 'CMD',
    		action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
    	},
    	{
    		key = 'w',
    		mods = 'CMD',
    		action = wezterm.action.CloseCurrentPane({ confirm = false }),
    	},
    
    	-- Switch between tabs
    	{
    		key = 'LeftArrow',
    		mods = 'CMD|ALT',
    		action = wezterm.action.ActivateTabRelative(-1),
    	},
    	{
    		key = 'RightArrow',
    		mods = 'CMD|ALT',
    		action = wezterm.action.ActivateTabRelative(1),
    	},
    
    	-- Switch between panes
    	{
    		key = 'LeftArrow',
    		mods = 'CMD|SHIFT',
    		action = wezterm.action.ActivatePaneDirection('Prev'),
    	},
    	{
    		key = 'RightArrow',
    		mods = 'CMD|SHIFT',
    		action = wezterm.action.ActivatePaneDirection('Next'),
    	},
    
    	-- Jump word to the left
    	{
    		key = 'LeftArrow',
    		mods = 'OPT',
    		action = wezterm.action.SendKey({ key = 'b', mods = 'ALT' }),
    	},
    	
    	-- Jump word to the right
    	{
    		key = 'RightArrow',
    		mods = 'OPT',
    		action = wezterm.action.SendKey({ key = 'f', mods = 'ALT' }),
    	},
    	-- Go to beginning of line
    	{
    		key = 'LeftArrow',
    		mods = 'CMD',
    		action = wezterm.action.SendKey({
    		key = 'a',
    		mods = 'CTRL',
    		}),
    	},
    	
    	-- Go to end of line
    	{
    		key = 'RightArrow',
    		mods = 'CMD',
    		action = wezterm.action.SendKey({ key = 'e', mods = 'CTRL' }),
    	},
    	
    	-- Case-insensitive search
    	{
    		key = 'f',
    		mods = 'CMD',
    		action = wezterm.action.Search({ CaseInSensitiveString = '' }),
    	},
    
    	-- Disable some default hotkeys
    	{
    		key = 'Enter',
    		mods = 'OPT',
    		action = wezterm.action.DisableDefaultAssignment,
    	},
    
    	-- Rename tab title
    	{
    		key = 'R',
    		mods = 'CMD|SHIFT',
    		action = wezterm.action.PromptInputLine {
    			description = 'Enter new name for tab',
    			action = wezterm.action_callback(function(window, _, line)
    				-- line will be `nil` if they hit escape without entering anything
    				-- An empty string if they just hit enter
    				-- Or the actual line of text they wrote
    				if line then
    					window:active_tab():set_title(line)
    				end
    			end),
    		},
    	},
    }
}

return M
