if ( getroottable().rawin(self.GetName() + "_INC_TERMINALS_AWAITING_MESSAGE") )
{
	return;
}

getroottable()[self.GetName() + "_INC_TERMINALS_AWAITING_MESSAGE"] <- true;

IncludeScript("rowhammer/terminals/common/Defs.nut");
IncludeScript("rowhammer/terminals/common/TerminalInstance.nut");

::AM_Screens <-
{
	EMPTY = 0,
	POWER_WARNING_THIRTY_PERCENT = 1,
	POWER_WARNING_TWENTY_NINE_PERCENT = 2,
	POWER_WARINING_INSUFFICIENT_PERMISSIONS = 3,
	MESSAGE_HOME_SCREEN = 4,
	MESSAGE_INFO = 5,
	DISPLAY_MESSAGE = 6,
	DISPLAY_MESSAGE_SOURCE = 7,
	TRANSPORTING = 8
};

class EventHandler extends ::RHTerminal.EventHandler
{
	currentScreen = ::AM_Screens.MESSAGE_HOME_SCREEN;
	haveTriggeredFirstWarning = false;
	haveTriggeredSecondWarning = false;
	screenToReturnTo = ::AM_Screens.MESSAGE_HOME_SCREEN;
	warningToReturnTo = ::AM_Screens.POWER_WARNING_THIRTY_PERCENT;

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

	function LeftButtonOut(terminal)
	{
		if ( currentScreen >= ::AM_Screens.MESSAGE_INFO && currentScreen < ::AM_Screens.TRANSPORTING )
		{
			currentScreen -= 1;
		}
		else if ( currentScreen == ::AM_Screens.POWER_WARNING_THIRTY_PERCENT )
		{
			EntFire("ignore_first_warning", "Trigger", "", 0.0, terminal);
			currentScreen = screenToReturnTo;
		}
		else if ( currentScreen == ::AM_Screens.POWER_WARNING_TWENTY_NINE_PERCENT )
		{
			EntFire("ignore_second_warning", "Trigger", "", 0.0, terminal);
			currentScreen = screenToReturnTo;
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
		if ( currentScreen >= ::AM_Screens.MESSAGE_HOME_SCREEN && currentScreen < ::AM_Screens.TRANSPORTING )
		{
			if ( currentScreen == ::AM_Screens.MESSAGE_HOME_SCREEN && !haveTriggeredFirstWarning )
			{
				screenToReturnTo = currentScreen;
				currentScreen = ::AM_Screens.POWER_WARNING_THIRTY_PERCENT;
				EntFire("trigger_first_warning", "Trigger", "", 0.0, terminal);
				haveTriggeredFirstWarning = true;
			}
			else if ( currentScreen == ::AM_Screens.DISPLAY_MESSAGE_SOURCE && !haveTriggeredSecondWarning )
			{
				screenToReturnTo = currentScreen;
				currentScreen = ::AM_Screens.POWER_WARNING_TWENTY_NINE_PERCENT;
				EntFire("trigger_second_warning", "Trigger", "", 0.0, terminal);
				haveTriggeredSecondWarning = true;
			}
			else
			{
				currentScreen += 1;

				if ( currentScreen == ::AM_Screens.TRANSPORTING )
				{
					EntFire("trigger_transport", "Trigger", "", 0.0, terminal);
				}
			}
		}
		else if ( currentScreen == ::AM_Screens.POWER_WARNING_THIRTY_PERCENT )
		{
			warningToReturnTo = currentScreen;
			currentScreen == ::AM_Screens.POWER_WARINING_INSUFFICIENT_PERMISSIONS;
		}
		else if ( currentScreen == ::AM_Screens.POWER_WARNING_TWENTY_NINE_PERCENT )
		{
			warningToReturnTo = currentScreen;
			currentScreen == ::AM_Screens.POWER_WARINING_INSUFFICIENT_PERMISSIONS;
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
