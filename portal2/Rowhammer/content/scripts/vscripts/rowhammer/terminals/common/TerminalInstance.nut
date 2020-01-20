if ( getroottable().rawin("INC_TERMINALS_COMMON_TERMINALINSTANCE") )
{
    return;
}

getroottable()["INC_TERMINALS_COMMON_TERMINALINSTANCE"] <- true;

IncludeScript("rowhammer/terminals/common/Defs.nut");

class ::RHTerminal.TerminalInstance
{
    constructor(monitor)
    {
        Monitor = monitor;
    }

    Monitor = null;
    Screen = null;
    LeftButton = null;
    LeftButtonSymbol = null;
    RightButton = null;
    RightButtonSymbol = null;
}

::RHTerminal.StaticTerminalInstance <- null;

::RHTerminal.GetStaticTerminalInstance <- function()
{
    return ::RHTerminal.StaticTerminalInstance;
}

::RHTerminal.SetStaticTerminalInstance <- function(term)
{
    ::RHTerminal.StaticTerminalInstance = term;
}
