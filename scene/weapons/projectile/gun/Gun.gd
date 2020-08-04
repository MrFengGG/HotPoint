extends "res://scene/weapons/weapon.gd"
onready var animationPlayer = $Pviot/Muzzle/AnimationPlayer

func _ready():
	animationPlayer.playback_speed = speed

func attack(delta):
	animationPlayer.play("Fire")
