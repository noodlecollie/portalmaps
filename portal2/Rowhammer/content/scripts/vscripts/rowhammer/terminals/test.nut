if ( getroottable().rawin(self.GetName() + "_INC_TERMINALS_TEST") )
{
	return;
}

getroottable()[self.GetName() + "_INC_TERMINALS_TEST"] <- true;

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

	function PowerOn(terminal)
	{
	}

	function PowerOff(terminal)
	{
	}

	function LeftButtonStartPress(terminal)
	{
		::Log.DevLog("Left button start press");
	}

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
		terminal.SetScreen(skinNo);
	}

	function RightButtonStartPress(terminal)
	{
		::Log.DevLog("Right button start press");
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
		terminal.SetScreen(skinNo);
	}
}

local inst = ::RHTerminal.CreateAndRegisterInstance(self);

inst.SetEventHandler(EventHandler());
inst.SetLeftButtonAnimation(::RHTerminal.ButtonSymbolAnimation.SQUARE);
inst.SetRightButtonAnimation(::RHTerminal.ButtonSymbolAnimation.CIRCLE);
inst.SetTerminalPowerOn(true);
