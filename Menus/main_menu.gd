extends Control

@onready var animTimer := $anim_timer
var counter = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/start_button.grab_click_focus()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if counter < 16:
		get_node("BitsByte").scale += Vector2(delta, delta)/8
		counter += 1
	else:
		get_node("BitsByte").scale -= Vector2(delta, delta)/8
		counter += 1
		if counter == 32:
			counter = 0
		
		

#func _on_start_button_pressed():
#	get_tree().change_scene("")


#func _on_options_button_pressed():
#	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()
