if ( getroottable().rawin("INC_TERMINALS_AWAITING_MESSAGE") )
{
	return;
}

getroottable()["INC_TERMINALS_AWAITING_MESSAGE"] <- true;

IncludeScript("rowhammer/terminals/common/Defs.nut");
IncludeScript("rowhammer/terminals/common/TerminalInstance.nut");

::Screens <-
{
	POWER_WARNING_THIRTY_PERCENT = 0,
	POWER_WARNING_TWENTY_NINE_PERCENT = 1,
	MESSAGE_HOME_SCREEN = 2,
	MESSAGE_INFO = 3,
	DISPLAY_MESSAGE = 4,
	DISPLAY_MESSAGE_SOURCE = 5,
	TRANSPORTING = 6
};

class EventHandler extends ::RHTerminal.EventHandler
{
	currentScreen = ::Screens.MESSAGE_HOME_SCREEN;

	function PowerOn(terminal)
	{
		terminal.SetScreen(currentScreen);
	}

	function PowerOff(terminal)
	{
		currentScreen = ::Screens.EMPTY;
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
		/*if ( currentScreen == ::Screens.ESCALATE )
		{
			currentScreen = ::Screens.MAIN;
		}
		else if ( currentScreen == ::Screens.MAIN )
		{
			currentScreen = ::Screens.EXIT;
			EntFire("release_relay", "Trigger", "", 0.0, terminal);
		}*/

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
		/*if ( currentScreen == ::Screens.MAIN )
		{
			currentScreen = ::Screens.ESCALATE;
		}*/

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
