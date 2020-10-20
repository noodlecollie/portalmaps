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
    function LeftButtonStartPress(terminal)
    {
    }

    function LeftButtonIn(terminal)
    {
    }

    function LeftButtonOut(terminal)
    {
    }

    function RightButtonStartPress(terminal)
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

    function SetTerminalPowerOn(isOn)
    {
        local skinIndex = isOn ? ::RHTerminal.MonitorSkin.ON : ::RHTerminal.MonitorSkin.OFF;
        local enabledInput = isOn ? "Enable" : "Disable";
        local unlockedInput = isOn ? "Unlock" : "Lock";

        EntFireByHandle(_Monitor, "Skin", skinIndex.tostring(), 0.0, _Monitor, _Monitor);
        EntFireByHandle(_Screen, enabledInput, "", 0.0, _Monitor, _Monitor);
        EntFireByHandle(_LeftButtonSymbol, enabledInput, "", 0.0, _Monitor, _Monitor);
        EntFireByHandle(_RightButtonSymbol, enabledInput, "", 0.0, _Monitor, _Monitor);
        EntFireByHandle(_LeftButton, unlockedInput, "", 0.0, _Monitor, _Monitor);
        EntFireByHandle(_RightButton, unlockedInput, "", 0.0, _Monitor, _Monitor);
    }

    function SetScreen(index)
    {
        EntFireByHandle(_Screen, "Skin", index.tostring(), 0.0, _Monitor, _Monitor);
    }

    function SetLeftButtonSymbol(index)
    {
        EntFireByHandle(_LeftButtonSymbol, "Skin", index.tostring(), 0.0, _Monitor, _Monitor);
    }

    function SetLeftButtonAnimation(anim)
    {
        _LeftButtonAnimation = anim;

        if ( _LeftButtonAnimation != null )
        {
            SetLeftButtonSymbol(_LeftButtonAnimation[0]);
        }
    }

    function SetRightButtonSymbol(index)
    {
        EntFireByHandle(_RightButtonSymbol, "Skin", index.tostring(), 0.0, _Monitor, _Monitor);
    }

    function SetRightButtonAnimation(anim)
    {
        _RightButtonAnimation = anim;

        if ( _RightButtonAnimation != null )
        {
            SetRightButtonSymbol(_RightButtonAnimation[0]);
        }
    }

    /////////////////////////////////////////////////////////////
    // Event handler functions from terminal components
    /////////////////////////////////////////////////////////////

    function LeftButtonStartPress()
    {
        if ( _LeftButtonAnimation != null )
        {
            SetLeftButtonSymbol(_LeftButtonAnimation[1]);
        }

        if ( _EventHandler != null )
        {
            _EventHandler.LeftButtonStartPress(this);
        }
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
        if ( _LeftButtonAnimation != null )
        {
            SetLeftButtonSymbol(_LeftButtonAnimation[0]);
        }

        if ( _EventHandler != null )
        {
            _EventHandler.LeftButtonOut(this);
        }
    }

    function RightButtonStartPress()
    {
        if ( _RightButtonAnimation != null )
        {
            SetRightButtonSymbol(_RightButtonAnimation[1]);
        }

        if ( _EventHandler != null )
        {
            _EventHandler.RightButtonStartPress(this);
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
        if ( _RightButtonAnimation != null )
        {
            SetRightButtonSymbol(_RightButtonAnimation[0]);
        }

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

    // Other properties:
    _LeftButtonAnimation = null;
    _RightButtonAnimation = null;
}

// When this script is loaded for the entity, this line will be called.
// Self will refer to the entity that loaded the script (the monitor model).
::RHTerminal.StaticTerminalInstance <- ::RHTerminal.TerminalInstance(self)

// These functions are invoked by the different components of the terminal.
function LeftButtonStartPress()
{
    if ( ::RHTerminal.StaticTerminalInstance )
    {
        ::RHTerminal.StaticTerminalInstance.LeftButtonStartPress();
    }
}

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

function RightButtonStartPress()
{
    if ( ::RHTerminal.StaticTerminalInstance )
    {
        ::RHTerminal.StaticTerminalInstance.RightButtonStartPress();
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
