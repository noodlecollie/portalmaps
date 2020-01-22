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

    function SetMonitorSkin(skin)
    {
        EntFireByHandle(MonitorSkin, "SetValue", skin.tostring(), 0, Monitor, Monitor);
    }

    Monitor = null;
    MonitorSkin = null;
    Screen = null;
    LeftButton = null;
    LeftButtonSymbol = null;
    RightButton = null;
    RightButtonSymbol = null;
}

// When this script is loaded for the entity, this line will be called.
// Self will refer to the entity that loaded the script.
::RHTerminal.StaticTerminalInstance <- ::RHTerminal.TerminalInstance(self)

::RHTerminal.GetStaticTerminalInstance <- function()
{
    return ::RHTerminal.StaticTerminalInstance;
}

::RHTerminal.SetStaticTerminalInstance <- function(term)
{
    ::RHTerminal.StaticTerminalInstance = term;
}
