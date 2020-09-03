extends "res://scene/weapons/parts/bullets/Bullet.gd"


var follow

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	start_time += delta
	if start_time >= aliveTime:
		queue_free()
	if follow:
		direction = (follow.position - position).normized()
	var velocity = direction * delta * speed
	hitBox.knockback_vector = direction
	move_and_slide(velocity)


func _on_HitBox_area_entered(area):
	queue_free()
	
func _on_SearchBox_area_entered(body):
	follow = body
