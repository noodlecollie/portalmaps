if ( getroottable().rawin("INC_TERMINALS_COMMON_DEFS") )
{
    return;
}

getroottable()["INC_TERMINALS_COMMON_DEFS"] <- true;

IncludeScript("rowhammer/terminals/common/ScriptEnv.nut");

::RHTerminal.ButtonSymbolSkin <-
{
    SQUARE_FILLED = 0,
    SQUARE_OUTLINE = 1,
    SQUARE_DOT = 2,
    CIRCLE_FILLES = 3,
    CIRCLE_OUTLINE = 4,
    CIRCLE_DOT = 5,

    _COUNT = 6
};

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

::RHTerminal.EntityId <-
{
    SCREEN = "screen",
    BUTTON_LEFT = "button_left",
    BUTTON_RIGHT = "button_right",
    BUTTON_SYM_LEFT = "button_left_symbol",
    BUTTON_SYM_RIGHT = "button_right_symbol"
};
