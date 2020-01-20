if ( getroottable().rawin("INC_TERMINALS_COMMON_TERMINALENTITYREGISTRATIONMANAGER") )
{
    return;
}

getroottable()["INC_TERMINALS_COMMON_TERMINALENTITYREGISTRATIONMANAGER"] <- true;

IncludeScript("rowhammer/terminals/common/Defs.nut");
IncludeScript("rowhammer/terminals/common/TerminalInstance.nut");
IncludeScript("rowhammer/lib/StringLib.nut");
IncludeScript("rowhammer/lib/Log.nut");

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
        [::RHTerminal.EntityId.BUTTON_SYM_RIGHT] = "RightButtonSymbol"
    };
}

::RHTerminal.BeginEntityRegistration <- function()
{
    local terminal = ::RHTerminal.GetStaticTerminalInstance()
    EntFireByHandle(terminal.Monitor, "FireUser1", "", 0, terminal.Monitor, terminal.Monitor);
}
