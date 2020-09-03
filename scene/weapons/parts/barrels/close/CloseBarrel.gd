extends "res://scene/weapons/parts/barrels/Barrel.gd"

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite
onready var audioPlayer = $AudioStreamPlayer

func _ready():
	animationPlayer.playback_speed = speed
	sprite.hide()
	
func fire(bullet, weaponEffect):
	fire_is_over = false
	audioPlayer.play()
	animationPlayer.play("attack")

func onFireIsOver():
	fire_is_over = true

