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

printl("*** ROWHAMMER: Calling terminal script test.nut ***");
printl("Entity using script: " + self.GetName() + " (" + self.GetClassname() + ")");

class EventHandler extends ::RHTerminal.EventHandler
{
    skinNo = 0;

    function LeftButtonIn(terminal)
    {
        ::Log.DevLog("Left button in");
    }

    function LeftButtonOut(terminal)
    {
        if ( skinNo > 0 )
        {
            skinNo -= 1;
        }

        ::Log.DevLog("Left button out (skin " + skinNo + ")");
    }

    function RightButtonIn(terminal)
    {
        ::Log.DevLog("Right button in");
    }

    function RightButtonOut(terminal)
    {
        if ( skinNo < 2 )
        {
            skinNo += 1;
        }

        ::Log.DevLog("Right button out (skin " + skinNo + ")");
    }
}

::RHTerminal.StaticTerminalInstance.SetEventHandler(EventHandler());
