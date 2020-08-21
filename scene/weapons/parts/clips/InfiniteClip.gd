extends Clip

class_name InfiniteClip

export var currentBulletType = "normal"

var bulletScene
func _ready():
	bulletScene = preload("res://scene/weapons/parts/bullets/Bullet.tscn")

func applyBullet():
	return bulletScene.instance()
