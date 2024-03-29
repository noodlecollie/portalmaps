if ( getroottable().rawin(self.GetName() + "_INC_TERMINALS_COMMON_DEFS") )
{
	return;
}

getroottable()[self.GetName() + "_INC_TERMINALS_COMMON_DEFS"] <- true;

IncludeScript("rowhammer/terminals/common/ScriptEnv.nut");

// Corresponds to skins on the button models.
::RHTerminal.ButtonSymbolSkin <-
{
	SQUARE_FILLED = 0,
	SQUARE_OUTLINE = 1,
	SQUARE_DOT = 2,
	CIRCLE_FILLED = 3,
	CIRCLE_OUTLINE = 4,
	CIRCLE_DOT = 5,

	_COUNT = 6
};

::RHTerminal.ButtonSymbolAnimation <-
{
	SQUARE = [::RHTerminal.ButtonSymbolSkin.SQUARE_OUTLINE, ::RHTerminal.ButtonSymbolSkin.SQUARE_DOT]
	CIRCLE = [::RHTerminal.ButtonSymbolSkin.CIRCLE_OUTLINE, ::RHTerminal.ButtonSymbolSkin.CIRCLE_DOT]
};

// Corresponds to skins on the operator models.
::RHTerminal.OperatorSkin <-
{
	CHEVRON_UP = 0,
	CHEVRON_UP_INV = 1,
	CHEVRON_DOWN = 2,
	CHEVRON_DOWN_INV = 3,
	CROSS = 4,
	CROSS_INV = 5,

	_COUNT = 6
};

// Corresponds to skins on the monitor model.
::RHTerminal.MonitorSkin <-
{
	ON = 3,
	OFF = 4
};

// These must correspond to entity names in the terminal instance.
// They are checked as suffixes on the in-game entity names, so
// avoid choosing IDs where one ID is a suffix of a different, longer ID.
// Prefixes are OK, though.
::RHTerminal.EntityId <-
{
	SCREEN = "screen",
	BUTTON_LEFT = "button_left",
	BUTTON_RIGHT = "button_right",
	BUTTON_SYM_LEFT = "button_left_symbol",
	BUTTON_SYM_RIGHT = "button_right_symbol",
	MONITOR_SKIN = "monitor_skin"
};
