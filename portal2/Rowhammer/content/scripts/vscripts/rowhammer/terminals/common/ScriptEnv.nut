if ( getroottable().rawin("INC_TERMINALS_COMMON_SCRIPTENV") )
{
	return;
}

getroottable()["INC_TERMINALS_COMMON_SCRIPTENV"] <- true;

// Ensures that the script environment container object exists.
::RHTerminal <-
{
};
