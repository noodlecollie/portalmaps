$modelname "rowhammer/paper_bent.mdl"
$scale 3

$bodygroup "default"
{
	studio "paper_bent.smd"
}

$surfaceprop "paper"
$contents "solid"
$staticprop

$cdmaterials "models\rowhammer\paper"

$texturegroup "skinfamilies"
{
	{ "paper_blank" "paper_writing" }
	{ "paper_blank" "paper_writing1" }
	{ "paper_blank" "paper_writing2" }
	{ "paper_blank" "paper_writing3" }
}

$sequence "BindPose" "paper_bent.smd"

$KeyValues
{
}
