extends KinematicBody2D

export (float) var speed = 50000
export (Vector2) var direction = Vector2(0, 0)
export (float) var shootRange = 100000
export (float) var aliveTime = 1

onready var hitBox = $HitBox

var start_time = 0

func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	start_time += delta
	if start_time >= aliveTime:
		queue_free()
	var velocity = direction * delta * speed
	hitBox.knockback_vector = direction
	move_and_slide(velocity)


func _on_HitBox_area_entered(area):
	queue_free()
