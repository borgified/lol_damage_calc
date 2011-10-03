#!/usr/bin/perl

$target_armor=0;

$attacker_damage=100;

$percentage_armor_reduction=0;
$flat_armor_reduction=25;
$flat_armor_penetration=0;
$percentage_armor_penetration=0;

$effective_target_armor=($target_armor-($target_armor*$percentage_armor_reduction));

$effective_target_armor=($effective_target_armor-$flat_armor_reduction);

if($effective_target_armor<0){
	$damage_multiplier=(2-100/(100-($effective_target_armor)));
}else{
	$damage_multiplier=100/(100+$effective_target_armor);
}

$resulting_damage=$attacker_damage*$damage_multiplier;

print $resulting_damage;
