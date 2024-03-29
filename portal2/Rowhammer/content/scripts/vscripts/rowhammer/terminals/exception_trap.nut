if ( getroottable().rawin(self.GetName() + "_INC_TERMINALS_EXCEPTION_TRAP") )
{
	return;
}

getroottable()[self.GetName() + "_INC_TERMINALS_EXCEPTION_TRAP"] <- true;

IncludeScript("rowhammer/terminals/common/Defs.nut");
IncludeScript("rowhammer/terminals/common/TerminalInstance.nut");

::ET_Screens <-
{
	EMPTY = 0,
	MAIN = 1,
	ESCALATE = 2,
	EXIT = 3
};

class EventHandler extends ::RHTerminal.EventHandler
{
	currentScreen = ::ET_Screens.MAIN;

	function PowerOn(terminal)
	{
		terminal.SetScreen(currentScreen);
	}

	function PowerOff(terminal)
	{
		currentScreen = ::ET_Screens.MAIN;
		terminal.SetScreen(currentScreen);
	}

	function LeftButtonStartPress(terminal)
	{
	}

	function LeftButtonIn(terminal)
	{
	}

	function LeftButtonOut(terminal)
	{
		if ( currentScreen == ::ET_Screens.ESCALATE )
		{
			currentScreen = ::ET_Screens.MAIN;
		}
		else if ( currentScreen == ::ET_Screens.MAIN )
		{
			currentScreen = ::ET_Screens.EXIT;
			EntFire("release_relay", "Trigger", "", 0.0, terminal);
		}

		terminal.SetScreen(currentScreen);
	}

	function RightButtonStartPress(terminal)
	{
	}

	function RightButtonIn(terminal)
	{
	}

	function RightButtonOut(terminal)
	{
		if ( currentScreen == ::ET_Screens.MAIN )
		{
			currentScreen = ::ET_Screens.ESCALATE;
		}

		terminal.SetScreen(currentScreen);
	}
}

local inst = ::RHTerminal.CreateAndRegisterInstance(self);

inst.SetEventHandler(EventHandler());
inst.SetLeftButtonAnimation(::RHTerminal.ButtonSymbolAnimation.CIRCLE);
inst.SetRightButtonAnimation(::RHTerminal.ButtonSymbolAnimation.CIRCLE);

function PowerOn()
{
	::RHTerminal.GetInstance(self).SetTerminalPowerOn(true);
}
