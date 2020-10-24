if ( getroottable().rawin("INC_TERMINALS_EXCEPTION_TRAP") )
{
	return;
}

getroottable()["INC_TERMINALS_EXCEPTION_TRAP"] <- true;

IncludeScript("rowhammer/terminals/common/Defs.nut");
IncludeScript("rowhammer/terminals/common/TerminalInstance.nut");

::Screens <-
{
	EMPTY = 0,
	MAIN = 1,
	ESCALATE = 2,
	EXIT = 3
};

class EventHandler extends ::RHTerminal.EventHandler
{
	currentScreen = ::Screens.MAIN;

	function PowerOn(terminal)
	{
		terminal.SetScreen(currentScreen);
	}

	function PowerOff(terminal)
	{
		currentScreen = ::Screens.MAIN;
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
		if ( currentScreen == ::Screens.ESCALATE )
		{
			currentScreen = ::Screens.MAIN;
		}
		else if ( currentScreen == ::Screens.MAIN )
		{
			currentScreen = ::Screens.EXIT;
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
		if ( currentScreen == ::Screens.MAIN )
		{
			currentScreen = ::Screens.ESCALATE;
		}

		terminal.SetScreen(currentScreen);
	}
}

local inst = ::RHTerminal.StaticTerminalInstance;

inst.SetEventHandler(EventHandler());
inst.SetLeftButtonAnimation(::RHTerminal.ButtonSymbolAnimation.CIRCLE);
inst.SetRightButtonAnimation(::RHTerminal.ButtonSymbolAnimation.CIRCLE);

function PowerOn()
{
	::RHTerminal.StaticTerminalInstance.SetTerminalPowerOn(true);
}
