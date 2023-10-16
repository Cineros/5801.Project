#Made on 10/16/2023 By Darius Wolfe
extends Node2D

var mousePOS
@onready var fireDelay := $fire_Delay
@onready var cursor = get_node("Cursor")

func launch(angle):
	var cursor = load("res://Towers/Cursor_Tower/cursor_tower.tscn").instantiate()
	get_parent().add_child(cursor)
	cursor.global_position = get_node("midPoint").global_position
	var cursor_rotation = get_node("midPoint").global_position.direction_to(get_global_mouse_position()).angle()
	cursor.rotation = cursor_rotation
	fireDelay.start()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	mousePOS = get_local_mouse_position()
	rotation += mousePOS.angle()*1
	
func _input(_event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and fireDelay.is_stopped():
		get_node("Cursor").hide()
		launch(mousePOS)
		get_parent().get_node("CursorLandingPlatform/Reload").play("reload")
		
	pass



func _on_reload_animation_finished():
	get_node("Cursor").show()
