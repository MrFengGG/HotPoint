extends "res://scene/weapons/parts/barrels/Barrel.gd"

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite
onready var audioPlayer = $AudioStreamPlayer

var bulletScene = preload("res://scene/weapons/parts/bullets/Bullet.tscn")

func _ready():
	animationPlayer.playback_speed = speed
	sprite.hide()
	
func fire(bullet, weaponEffect):
	animationPlayer.play("fire")
	audioPlayer.play()
	var bulletNode = bulletScene.instance()
	bulletNode.direction = (get_global_mouse_position() - global_position).normalized()
	bulletNode.position = global_position
	bulletNode.rotation = bulletNode.direction.angle()
	self.get_tree().get_root().add_child(bulletNode)
