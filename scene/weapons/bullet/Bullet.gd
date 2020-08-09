extends KinematicBody2D

export (float) var speed = 50000
export (Vector2) var direction = Vector2(0, 0)
export (float) var shootRange = 100000
export (float) var aliveTime = 1

var startTime = 0

func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	startTime += delta
	if startTime >= aliveTime:
		queue_free()
	var velocity = direction * delta * speed
	move_and_slide(velocity)
