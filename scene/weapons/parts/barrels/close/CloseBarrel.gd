extends "res://scene/weapons/parts/barrels/Barrel.gd"

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite
onready var audioPlayer = $AudioStreamPlayer

func _ready():
	animationPlayer.playback_speed = speed
	sprite.hide()
	
func fire(bullet, weaponEffect):
	fireIsOver = false
	audioPlayer.play()
	animationPlayer.play("attack")

func onFireIsOver():
	fireIsOver = true

