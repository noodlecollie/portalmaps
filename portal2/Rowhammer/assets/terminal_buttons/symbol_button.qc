$modelname "rowhammer/terminal_button.mdl"

$bodygroup "default"
{
	studio "symbol_button.smd"
}

$surfaceprop "glass"

$contents "solid"

$illumposition 0 0 0

$cdmaterials "models/rowhammer/terminal_buttons"

$texturegroup "skinfamilies"
{
	{ "filled_square" }
	{ "square" }
	{ "square_dot" }
	{ "circle" }
	{ "circle_dot" }
}

$cbox 0 0 0 0 0 0

$bbox 0 0 0 1 3 3

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
