extends "res://scene/weapons/parts/barrels/Barrel.gd"

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite

func _ready():
	sprite.hide()
	
func fire(bullet, weaponEffect):
	fireIsOver = false
	animationPlayer.play("attack")

func onFireIsOver():
	fireIsOver = true

