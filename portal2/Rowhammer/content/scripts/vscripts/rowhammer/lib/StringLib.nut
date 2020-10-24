// Guess who's a C programmer as their day job?
// (Hint: it's me)
if ( getroottable().rawin("INC_LIB_STRINGLIB") )
{
	return;
}

getroottable()["INC_LIB_STRINGLIB"] <- true;

::StringLib <-
{
	function endswith(str, suffix)
	{
		local strLength = str.len();
		local suffixLength = suffix.len();

		if ( suffixLength > strLength )
		{
			return false;
		}

		for ( local offset = 0; offset < suffixLength; ++offset )
		{
			if ( str[strLength - offset - 1] != suffix[suffixLength - offset - 1] )
			{
				return false;
			}
		}

		return true;
	}

	function prefixBeforeFirstHyphen(str)
	{
		local hyphenIndex = str.find("-")

		if ( hyphenIndex == null )
		{
			return str;
		}

		return str.slice(0, hyphenIndex);
	}
}
