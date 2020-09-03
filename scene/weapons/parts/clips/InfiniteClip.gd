extends Clip

class_name InfiniteClip

export var currentBulletType = "normal"

var bullet_scene
func _ready():
	bullet_scene = preload("res://scene/weapons/parts/bullets/Bullet.tscn")

func applyBullet():
	return bullet_scene.instance()
