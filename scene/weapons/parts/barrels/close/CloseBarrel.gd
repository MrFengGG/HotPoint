extends "res://scene/weapons/parts/barrels/Barrel.gd"

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite
onready var audioPlayer = $AnimationPlayer

func _ready():
	sprite.hide()
	
func fire(bullet, weaponEffect):
	fireIsOver = false
	audioPlayer.play()
	animationPlayer.play("attack")

func onFireIsOver():
	fireIsOver = true

