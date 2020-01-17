$modelname "rowhammer/terminal_screen_base.mdl"

$bodygroup "default"
{
	studio "terminal_screen_base.smd"
}

$surfaceprop "glass"

$contents "solid"

$illumposition 0 0 0

$cdmaterials "models/rowhammer/terminal_screen_base"

$texturegroup "skinfamilies"
{
	{ "terminal_screen_base" }
	{ "terminal_screen_base2" }
}

$cbox 0 0 0 0 0 0

$bbox -4 -22.8 -11.45 0 22.8 11.45

$definebone "root" "" 0 0 0 0 0 0 0 0 0 0 0 0

$sequence "BindPose" {
	"BindPose.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$KeyValues
{
}
