extends "res://scene/weapons/parts/bullets/Bullet.gd"

export (float) var speed = 50000
export (Vector2) var direction = Vector2(0, 0)
export (float) var aliveTime = 1

var startTime = 0
var follow

func _ready():
    pass # Replace with function body.

func _physics_process(delta):
	startTime += delta
	if startTime >= aliveTime:
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