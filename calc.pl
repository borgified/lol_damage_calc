#!/usr/bin/perl

$target_armor=100;

$attacker_damage=(100)*1.04;

print "attacker damage: $attacker_damage\n";
print "target armor: $target_armor\n";

$percentage_armor_reduction=0;
$flat_armor_reduction=0;
$flat_armor_penetration=31+45;
$percentage_armor_penetration=0;

#percentage_armor_reduction calculations
$effective_target_armor=($target_armor-($target_armor*$percentage_armor_reduction));

if($percentage_armor_reduction>0){
	print "effective armor due to percentage armor reduction: $effective_target_armor\n";
}

#flat_armor_reduction calculations
$effective_target_armor=($effective_target_armor-$flat_armor_reduction);

if($flat_armor_reduction>0){
	print "effective armor due to flat armor reduction: $effective_target_armor\n";
}

#if target armor is already negative, remaining calculations have no effect
if($effective_target_armor<0){
	$damage_multiplier=(2-100/(100-($effective_target_armor)));
	$resulting_damage=$attacker_damage*$damage_multiplier;
	print "resulting damage after damage mitigation from target's armor: $resulting_damage\n";
	exit;
}

#flat_armor_penetration calculations
$reduced_armor_value=$effective_target_armor-$flat_armor_penetration;

if($reduced_armor_value<0){
	#no change (flat armor pen cannot reduce below zero)
	$effective_target_armor=0;
}else{
	$effective_target_armor=$reduced_armor_value;
}


if($flat_armor_penetration>0){
	if($reduced_armor_value<0){
		print "effective armor due to flat armor penetration ($reduced_armor_value wasted): $effective_target_armor\n";
	}else{
		print "effective armor due to flat armor penetration: $effective_target_armor\n";
	}
}


#percentage_armor_penetration calculations
$effective_target_armor=$effective_target_armor-($effective_target_armor*$percentage_armor_penetration);

if($percentage_armor_penetration>0){
	print "effective armor due to percentage armor penetration: $effective_target_armor\n";
}

#resulting damage calculations
$damage_multiplier=100/(100+$effective_target_armor);

$resulting_damage=$attacker_damage*$damage_multiplier;

print "resulting damage after damage mitigation from target's armor: $resulting_damage\n";
