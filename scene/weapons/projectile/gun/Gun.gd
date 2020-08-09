extends "res://scene/weapons/weapon.gd"
onready var animationPlayer = $Pviot/Muzzle/AnimationPlayer
onready var muzzle = $Pviot/Muzzle

var bulletScene = preload("res://scene/weapons/bullet/Bullet.tscn")

func _ready():
	animationPlayer.playback_speed = speed

func attack(delta):
	animationPlayer.play("Fire")
	var bulletNode = bulletScene.instance()
	bulletNode.direction = (get_global_mouse_position() - muzzle.global_position).normalized()
	bulletNode.position = muzzle.global_position
	bulletNode.rotation = bulletNode.direction.angle()
	self.get_tree().get_root().add_child(bulletNode)
