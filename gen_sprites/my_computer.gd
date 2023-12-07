#Written by Darius Wolfe on 11/15/2023
extends CharacterBody2D

var comp_health: int = 100

signal hp_damage

func _on_computer_hitbox_body_entered(body):
	if "Enemy" in body.name:
		comp_health -= body.health
		body.health = 0
		#Working to get interface to function properly with data.
		emit_signal("hp_damage", comp_health)
		if comp_health == 0:
			pass
		#print(comp_health)
