extends "res://scene/weapons/weapon.gd"
onready var animationPlayer = $AnimationPlayer

func _ready():
	animationPlayer.playback_speed = speed
	hide()

func attack(delta):
	animationPlayer.play("Wave")
