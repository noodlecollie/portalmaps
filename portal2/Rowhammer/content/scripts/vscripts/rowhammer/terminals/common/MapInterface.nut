if ( getroottable().rawin("INC_TERMINALS_COMMON_MAPINTERFACE") )
{
    return;
}

getroottable()["INC_TERMINALS_COMMON_MAPINTERFACE"] <- true;

IncludeScript("rowhammer/terminals/common/TerminalInstance.nut");

// When this input is called on the monitor, it is in order to provide an entity
// handle to the terminal for use later.
function InputFireUser2()
{
    local instance = ::RHTerminal.GetStaticTerminalInstance();

    if ( instance )
    {
        local regMgr = ::RHTerminal.TerminalEntityRegistrationManager(instance);
        regMgr.RegisterEntity(caller);
    }

    // Don't actually fire the output.
    return false;
}

function LeftButtonIn()
{
    local instance = ::RHTerminal.GetStaticTerminalInstance();

    if ( instance )
    {
        instance.LeftButtonIn();
    }
}

function LeftButtonOut()
{
    local instance = ::RHTerminal.GetStaticTerminalInstance();

    if ( instance )
    {
        instance.LeftButtonOut();
    }
}

function RightButtonIn()
{
    local instance = ::RHTerminal.GetStaticTerminalInstance();

    if ( instance )
    {
        instance.RightButtonIn();
    }
}

function RightButtonOut()
{
    local instance = ::RHTerminal.GetStaticTerminalInstance();

    if ( instance )
    {
        instance.RightButtonOut();
    }
}
