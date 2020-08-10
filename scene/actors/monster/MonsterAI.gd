extends KinematicBody2D

var aliveTime = 0

export (float) var speed = 10

var knockback = Vector2.ZERO

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)
	
func _ready():
	pass # Replace with function body.

func _process(delta):
	aliveTime += delta
	move(delta)
	attack(delta)
	
func move(delta):
	pass

func attack(delta):
	pass
	
func _on_HurtBox_area_entered(area):
	if area.knockback_vector:
		knockback = area.knockback_vector * 200

