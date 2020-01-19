$modelname "rowhammer/terminal_screen_operator.mdl"

$bodygroup "default"
{
	studio "terminal_screen_operator.smd"
}

$surfaceprop "glass"

$contents "solid"

$illumposition 0 0 0

$cdmaterials "models\rowhammer\terminal_operators"

$texturegroup "skinfamilies"
{
	{ "chevron_up" }
	{ "chevron_up_inv" }
	{ "chevron_down" }
	{ "chevron_down_inv" }
	{ "cross" }
	{ "cross_inv" }
}

$cbox 0 0 0 0 0 0

$bbox -1 0 0 0 2 2

$definebone "root" "" 0 0 0 0 0 0 0 0 0 0 0 0

$sequence "BindPose" "terminal_screen_operator.smd"

$KeyValues
{
}
