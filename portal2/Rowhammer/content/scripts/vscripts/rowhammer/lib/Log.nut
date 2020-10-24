if ( getroottable().rawin("INC_LIB_LOG") )
{
	return;
}

getroottable()["INC_LIB_LOG"] <- true;

::Log <-
{
	function DevLog(str)
	{
		if ( GetDeveloperLevel() > 0 )
		{
			printl(str);
		}
	}
};
