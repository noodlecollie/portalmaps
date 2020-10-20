if ( getroottable().rawin("INC_TERMINALS_COMMON_TERMINALINSTANCE") )
{
    return;
}

getroottable()["INC_TERMINALS_COMMON_TERMINALINSTANCE"] <- true;

IncludeScript("rowhammer/terminals/common/Defs.nut");
IncludeScript("rowhammer/lib/StringLib.nut");
IncludeScript("rowhammer/lib/Log.nut");

class ::RHTerminal.EventHandler
{
    function LeftButtonIn(terminal)
    {
    }

    function LeftButtonOut(terminal)
    {
    }

    function RightButtonIn(terminal)
    {
    }

    function RightButtonOut(terminal)
    {
    }
}

class ::RHTerminal.TerminalInstance
{
    constructor(monitor)
    {
        _Monitor = monitor;
        _TerminalName = _Monitor.GetName();
        _ComponentPrefix = ::StringLib.prefixBeforeFirstHyphen(_TerminalName);

        _FindAllComponents();
    }

    function SetEventHandler(handler)
    {
        if ( !(handler instanceof ::RHTerminal.EventHandler) )
        {
            ::Log.DevLog("Terminal " + _TerminalName + ": Could not set event handler that does not derive from EventHandler class!");
            return;
        }

        _EventHandler = handler;
    }

    function LeftButtonIn()
    {
        if ( _EventHandler != null )
        {
            _EventHandler.LeftButtonIn(this);
        }
    }

    function LeftButtonOut()
    {
        if ( _EventHandler != null )
        {
            _EventHandler.LeftButtonOut(this);
        }
    }

    function RightButtonIn()
    {
        if ( _EventHandler != null )
        {
            _EventHandler.RightButtonIn(this);
        }
    }

    function RightButtonOut()
    {
        if ( _EventHandler != null )
        {
            _EventHandler.RightButtonOut(this);
        }
    }

    function _FindAllComponents()
    {
        local entitySuffixToVariableName =
        [
            [ "screen", "_Screen" ],
            [ "button_left", "_LeftButton" ],
            [ "button_left_symbol", "_LeftButtonSymbol" ],
            [ "button_right", "_RightButton" ],
            [ "button_right_symbol", "_RightButtonSymbol" ]
        ];

        foreach ( pair in entitySuffixToVariableName )
        {
            local entityName = _ComponentPrefix + "-" + pair[0];
            local propertyName = pair[1];

            local entHandle = Entities.FindByName(null, entityName);

            if ( entHandle == null )
            {
                ::Log.DevLog("Terminal " + _TerminalName + ": Could not find entity " + entityName + " for terminal component " + propertyName + "!");
            }

            ::Log.DevLog("Terminal " + _TerminalName + ": Registering entity " + entityName + " for component " + propertyName + ".");
            this[propertyName] = entHandle;
        }
    }

    // Computed entity name prefix. Other components are found
    // according to this prefix.
    _ComponentPrefix = null;

    // The name of the terminal itself. This is based off the name of the monitor.
    _TerminalName = ""

    // Host entity of the script: the monitor model
    _Monitor = null;

    // Other components of the terminal:
    _Screen = null;             // Model for displaying contents on the monitor
    _LeftButton = null;         // Left brush-based button
    _LeftButtonSymbol = null;   // Model indicator for this button
    _RightButton = null;        // Right brush-based button
    _RightButtonSymbol = null;  // Model indicator for this button

    // Event handler that passes events back to the loader script.
    _EventHandler = null;
}

// When this script is loaded for the entity, this line will be called.
// Self will refer to the entity that loaded the script (the monitor model).
::RHTerminal.StaticTerminalInstance <- ::RHTerminal.TerminalInstance(self)

// These functions are invoked by the different components of the terminal.
function LeftButtonIn()
{
    if ( ::RHTerminal.StaticTerminalInstance )
    {
        ::RHTerminal.StaticTerminalInstance.LeftButtonIn();
    }
}

function LeftButtonOut()
{
    if ( ::RHTerminal.StaticTerminalInstance )
    {
        ::RHTerminal.StaticTerminalInstance.LeftButtonOut();
    }
}

function RightButtonIn()
{
    if ( ::RHTerminal.StaticTerminalInstance )
    {
        ::RHTerminal.StaticTerminalInstance.RightButtonIn();
    }
}

function RightButtonOut()
{
    if ( ::RHTerminal.StaticTerminalInstance )
    {
        ::RHTerminal.StaticTerminalInstance.RightButtonOut();
    }
}
