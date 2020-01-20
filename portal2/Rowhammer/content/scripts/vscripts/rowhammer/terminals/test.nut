if ( getroottable().rawin("INC_TERMINALS_TEST") )
{
    return;
}

getroottable()["INC_TERMINALS_TEST"] <- true;

IncludeScript("rowhammer/terminals/common/Defs.nut");
IncludeScript("rowhammer/terminals/common/TerminalInstance.nut");
IncludeScript("rowhammer/terminals/common/TerminalEntityRegistrationManager.nut");
IncludeScript("rowhammer/terminals/common/MapInterface.nut");

printl("*** ROWHAMMER: Calling terminal script test.nut ***");
printl("Entity using script: " + self.GetName() + " (" + self.GetClassname() + ")");

::RHTerminal.SetStaticTerminalInstance(::RHTerminal.TerminalInstance(self));
::RHTerminal.BeginEntityRegistration()
