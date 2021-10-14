if ( getroottable().rawin(self.GetName() + "_INC_TERMINALS_AWAITING_MESSAGE") )
{
	return;
}

getroottable()[self.GetName() + "_INC_TERMINALS_AWAITING_MESSAGE"] <- true;

IncludeScript("rowhammer/terminals/common/Defs.nut");
IncludeScript("rowhammer/terminals/common/TerminalInstance.nut");

// The ordering here could be improved,
// but I've named the textures now and I CBA
::AM_Screens <-
{
	EMPTY = 0,
	POWER_WARNING_TWENTY_NINE_PERCENT = 1,
	POWER_WARINING_INSUFFICIENT_PERMISSIONS = 2,
	MESSAGE_HOME_SCREEN = 3,
	MESSAGE_HOME_SCREEN_WITH_NOTIF = 4,
	MESSAGE_INFO = 5,
	DISPLAY_MESSAGE = 6,
	DISPLAY_MESSAGE_SOURCE = 7,
	RENDER = 8,
	TRANSPORTING = 9
};

class EventHandler extends ::RHTerminal.EventHandler
{
	currentScreen = ::AM_Screens.MESSAGE_HOME_SCREEN;

	function PowerOn(terminal)
	{
		terminal.SetScreen(currentScreen);
	}

	function PowerOff(terminal)
	{
		currentScreen = ::AM_Screens.EMPTY;
		terminal.SetScreen(currentScreen);
	}

	function LeftButtonStartPress(terminal)
	{
	}

	function LeftButtonIn(terminal)
	{
	}

	// Go back
	function LeftButtonOut(terminal)
	{
		if ( currentScreen == ::AM_Screens.POWER_WARINING_INSUFFICIENT_PERMISSIONS )
		{
			// Pop back to warning
			currentScreen = ::AM_Screens.POWER_WARNING_TWENTY_NINE_PERCENT;
		}
		else if ( currentScreen == ::AM_Screens.POWER_WARNING_TWENTY_NINE_PERCENT )
		{
			// Ignore warning and pop back to home screen
			// but with notification icon now present
			currentScreen = ::AM_Screens.MESSAGE_HOME_SCREEN_WITH_NOTIF;
			EntFire("ignore_warning", "Trigger", "", 0.0, terminal);
		}
		else if ( currentScreen >= ::AM_Screens.MESSAGE_INFO && currentScreen < ::AM_Screens.TRANSPORTING )
		{
			// We're allowed to go back one screen.
			currentScreen -= 1;
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
		if ( currentScreen == ::AM_Screens.POWER_WARINING_INSUFFICIENT_PERMISSIONS )
		{
			// Cannot go any further
		}
		else if ( currentScreen == ::AM_Screens.POWER_WARNING_TWENTY_NINE_PERCENT )
		{
			// Cannot escalate warning
			currentScreen = ::AM_Screens.POWER_WARINING_INSUFFICIENT_PERMISSIONS;
		}
		else if ( currentScreen == ::AM_Screens.MESSAGE_HOME_SCREEN )
		{
			// Trigger warning
			currentScreen = ::AM_Screens.POWER_WARNING_TWENTY_NINE_PERCENT;
			EntFire("trigger_warning", "Trigger", "", 0.0, terminal);
		}
		else if ( currentScreen < ::AM_Screens.TRANSPORTING )
		{
			// We're allowed to go forward one screen.
			currentScreen += 1;

			if ( currentScreen == ::AM_Screens.TRANSPORTING )
			{
				terminal.LockAllButtons();
				EntFire("trigger_transport", "Trigger", "", 0.0, terminal);
			}
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
