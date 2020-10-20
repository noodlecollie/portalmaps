if ( getroottable().rawin("INC_TERMINALS_COMMON_TERMINALENTITYREGISTRATIONMANAGER") )
{
    return;
}

getroottable()["INC_TERMINALS_COMMON_TERMINALENTITYREGISTRATIONMANAGER"] <- true;

IncludeScript("rowhammer/terminals/common/Defs.nut");
IncludeScript("rowhammer/terminals/common/TerminalInstance.nut");
IncludeScript("rowhammer/lib/StringLib.nut");
IncludeScript("rowhammer/lib/Log.nut");

// Given a terminal instance and an entity wishing to register,
// sets the relevant variable on the terminal instance to point
// to this entity.
class ::RHTerminal.TerminalEntityRegistrationManager
{
    constructor(term)
    {
        Terminal = term;
    }

    function RegisterEntity(ent)
    {
        local name = ent.GetName();

        foreach ( key, value in suffixMapping )
        {
            if ( StringLib.endswith(name, key) )
            {
                Terminal[value] = ent;
                ::Log.DevLog("Registered entity " + name + " as '" + value + "' for terminal " + Terminal.Monitor.GetName() + ".");
                return;
            }
        }

        ::Log.DevLog("ERROR: Entity " + name + " (class " + ent.GetClassname() +
                     ") was not recognised as a terminal entity!");
    }

    Terminal = null;

    suffixMapping =
    {
        [::RHTerminal.EntityId.SCREEN] = "Screen",
        [::RHTerminal.EntityId.BUTTON_LEFT] = "LeftButton",
        [::RHTerminal.EntityId.BUTTON_RIGHT] = "RightButton",
        [::RHTerminal.EntityId.BUTTON_SYM_LEFT] = "LeftButtonSymbol",
        [::RHTerminal.EntityId.BUTTON_SYM_RIGHT] = "RightButtonSymbol",
        [::RHTerminal.EntityId.MONITOR_SKIN] = "MonitorSkin"
    };
}

::RHTerminal.BeginEntityRegistration <- function()
{
    local terminal = ::RHTerminal.GetStaticTerminalInstance()
    
    // Invoking this will cause RegisterEntity() to be called for each component of the terminal.
    // The logic to do so occurs in the Hammer map instance for the terminal.
    EntFireByHandle(terminal.Monitor, "FireUser1", "", 0, terminal.Monitor, terminal.Monitor);
}
