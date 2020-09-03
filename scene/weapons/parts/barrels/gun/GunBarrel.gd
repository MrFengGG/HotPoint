extends "res://scene/weapons/parts/barrels/Barrel.gd"

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite
onready var audioPlayer = $AudioStreamPlayer

var bullet_scene = preload("res://scene/weapons/parts/bullets/Bullet.tscn")

func _ready():
	animationPlayer.playback_speed = speed
	sprite.hide()
	
func fire(bullet, weapon_effect):
	animationPlayer.play("fire")
	audioPlayer.play()
	var bullet_node = bullet_scene.instance()
	bullet_node.direction = (get_global_mouse_position() - global_position).normalized()
	bullet_node.position = global_position
	bullet_node.rotation = bullet_node.direction.angle()
	self.get_tree().get_root().add_child(bullet_node)
