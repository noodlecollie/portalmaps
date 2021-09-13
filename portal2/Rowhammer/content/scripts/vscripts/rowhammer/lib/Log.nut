if ( getroottable().rawin(self.GetName() + "_INC_LIB_LOG") )
{
	return;
}

getroottable()[self.GetName() + "_INC_LIB_LOG"] <- true;

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
