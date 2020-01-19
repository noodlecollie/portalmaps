$modelname "rowhammer/terminal_screen_threebit.mdl"

$bodygroup "default"
{
	studio "terminal_screen_threebit.smd"
}

$surfaceprop "glass"

$contents "solid"

$illumposition 0 0 0

$cdmaterials "models\rowhammer\terminal_halfbytes"

$texturegroup "skinfamilies"
{
	{ "0000" }
	{ "0001" }
	{ "0010" }
	{ "0011" }
	{ "0100" }
	{ "0101" }
	{ "0110" }
	{ "0111" }
}

$cbox 0 0 0 0 0 0

$bbox -1 0 0 0 6 2

$definebone "root" "" 0 0 0 0 0 0 0 0 0 0 0 0

$sequence "BindPose" "terminal_screen_threebit.smd"

$KeyValues
{
}
