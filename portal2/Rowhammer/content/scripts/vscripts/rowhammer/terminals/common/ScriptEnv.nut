if ( getroottable().rawin(self.GetName() + "_INC_TERMINALS_COMMON_SCRIPTENV") )
{
	return;
}

getroottable()[self.GetName() + "_INC_TERMINALS_COMMON_SCRIPTENV"] <- true;

// Ensures that the script environment container object exists.
::RHTerminal <-
{
};
