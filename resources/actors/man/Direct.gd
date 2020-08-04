extends Node2D


onready var sprite = $AnimatedSprite
func _ready():
	pass # Replace with function body.
	

func _process(delta):
	var mousePosition = get_global_mouse_position()
	rotation = mousePosition.angle_to_point(position)
	sprite.flip_h = mousePosition.x > position.x;
