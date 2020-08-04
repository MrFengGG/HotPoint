extends Node2D

export var speed = 1
export var waveAngle = 45
var waveTime = speed / 1

onready var animationPlayer = $AnimationPlayer
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	pass

func attack(delta, attactDirect):
	rotation = attactDirect.angle()
	if(attactDirect.x < 0):
		scale.y = -1
	else:
		scale.y = 1
	animationPlayer.play("Wave")
	
	
