$modelname "rowhammer/terminal_screen_awaiting_message.mdl"

$bodygroup "default"
{
	studio "base/terminal_screen_base.smd"
}

$surfaceprop "glass"

$contents "solid"

$illumposition 0 0 0

$cdmaterials "models/rowhammer/terminal_screens/awaiting_message"

$texturegroup "skinfamilies"
{
	{ "terminal_screen_empty" }
	{ "screen1" }
	{ "screen2" }
	{ "screen3" }
	{ "screen4" }
	{ "screen5" }
	{ "screen6" }
	{ "screen7" }
	{ "screen8" }
}

$cbox 0 0 0 0 0 0

$bbox -4 -22.8 -11.45 0 22.8 11.45

$definebone "root" "" 0 0 0 0 0 0 0 0 0 0 0 0

$sequence "BindPose" "base/terminal_screen_base"
