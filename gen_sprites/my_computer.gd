#Written by Darius Wolfe on 11/15/2023
extends CharacterBody2D

var comp_health: int = 100
@onready var hbar = $"../Hbar"
@onready var hp_count = $"../hp_count"

func _on_computer_hitbox_body_entered(body):
	if "Enemy" in body.name:
		comp_health -= body.health
		body.health = 0
		#Working to get interface to function properly with data.
		hbar.value = comp_health
		hp_count.text = str(comp_health)
		if comp_health == 0:
			pass
		print(comp_health)
