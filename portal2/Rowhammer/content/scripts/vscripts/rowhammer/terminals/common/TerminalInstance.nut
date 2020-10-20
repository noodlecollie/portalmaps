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

    function LeftButtonIn()
    {
        InputHandler.LeftButtonIn();
    }

    function LeftButtonOut()
    {
        InputHandler.LeftButtonOut();
    }

    function RightButtonIn()
    {
        InputHandler.RightButtonIn();
    }

    function RightButtonOut()
    {
        InputHandler.RightButtonOut();
    }

    Monitor = null;
    MonitorSkin = null;
    Screen = null;
    LeftButton = null;
    LeftButtonSymbol = null;
    RightButton = null;
    RightButtonSymbol = null;
    InputHandler = null;
}

// Should be inherited from to handle input from the terminal.
class ::RHTerminal.InputHandler
{
    function LeftButtonIn()
    {
    }

    function LeftButtonOut()
    {
    }

    function RightButtonIn()
    {
    }

    function RightButtonOut()
    {
    }
}

// When this script is loaded for the entity, this line will be called.
// Self will refer to the entity that loaded the script.
::RHTerminal.StaticTerminalInstance <- ::RHTerminal.TerminalInstance(self)

::RHTerminal.GetStaticTerminalInstance <- function()
{
    if ( ::RHTerminal.StaticTerminalInstance == null )
    {
        ::Log.DevLog("GetStaticTerminalInstance(): Instance was null!");
    }

    return ::RHTerminal.StaticTerminalInstance;
}

::RHTerminal.SetStaticTerminalInstance <- function(term)
{
    ::RHTerminal.StaticTerminalInstance = term;
}
