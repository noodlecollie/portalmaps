if ( getroottable().rawin("INC_TERMINALS_TEST") )
{
    return;
}

getroottable()["INC_TERMINALS_TEST"] <- true;

// Defs relevant to terminal operation - skins for certain models, etc.
IncludeScript("rowhammer/terminals/common/Defs.nut");

// Class which encapsulates all the different components required to make a terminal:
// monitor, screen contents model, buttons, etc.
IncludeScript("rowhammer/terminals/common/TerminalInstance.nut");

// Class which manages hooking up all the entities required for the terminal to operate.
IncludeScript("rowhammer/terminals/common/TerminalEntityRegistrationManager.nut");

// Hooks into the User2 input and causes this to register the relevant entity with the terminal.
IncludeScript("rowhammer/terminals/common/MapInterface.nut");

printl("*** ROWHAMMER: Calling terminal script test.nut ***");
printl("Entity using script: " + self.GetName() + " (" + self.GetClassname() + ")");

class InputHandler extends ::RHTerminal.InputHandler
{
    function LeftButtonIn()
    {
        ::Log.DevLog("Left button in");
    }

    function LeftButtonOut()
    {
        ::Log.DevLog("Left button out");
    }

    function RightButtonIn()
    {
        ::Log.DevLog("Right button in");
    }

    function RightButtonOut()
    {
        ::Log.DevLog("Right button out");
    }
}

// Register all the terminal components.
::RHTerminal.BeginEntityRegistration()

local instance = ::RHTerminal.GetStaticTerminalInstance()

instance.InputHandler = InputHandler()
instance.SetMonitorSkin(::RHTerminal.MonitorSkin.ON)
