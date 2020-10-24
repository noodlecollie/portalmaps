$modelname "rowhammer/terminal_screen_exception_trap.mdl"

$bodygroup "default"
{
	studio "base/terminal_screen_base.smd"
}

$surfaceprop "glass"

$contents "solid"

$illumposition 0 0 0

$cdmaterials "models/rowhammer/terminal_screens/exception_trap"

$texturegroup "skinfamilies"
{
	{ "terminal_screen_empty" }
	{ "screen1" }
	{ "screen2" }
	{ "screen3" }
}

$cbox 0 0 0 0 0 0

$bbox -4 -22.8 -11.45 0 22.8 11.45

$definebone "root" "" 0 0 0 0 0 0 0 0 0 0 0 0

$sequence "BindPose" "base/terminal_screen_base"
