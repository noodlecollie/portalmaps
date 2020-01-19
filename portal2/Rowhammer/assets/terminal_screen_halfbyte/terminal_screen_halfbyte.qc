$modelname "rowhammer/terminal_screen_halfbyte.mdl"

$bodygroup "default"
{
	studio "terminal_screen_halfbyte.smd"
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
	{ "1000" }
	{ "1001" }
	{ "1010" }
	{ "1011" }
	{ "1100" }
	{ "1101" }
	{ "1110" }
	{ "1111" }
}

$cbox 0 0 0 0 0 0

$bbox -1 0 0 0 8 2

$definebone "root" "" 0 0 0 0 0 0 0 0 0 0 0 0

$sequence "BindPose" "terminal_screen_halfbyte.smd"

$KeyValues
{
}
