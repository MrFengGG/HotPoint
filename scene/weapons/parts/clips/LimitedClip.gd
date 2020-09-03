extends Clip

class_name LimitedClip

export (float) var bulletVolume = 1
export (float) var reloadTime = 1
export var currentBulletType = "normal"

var reloadStarTime = 0;
var reloading = false
var bulletScene
var remainBulletNum = 1

func _ready():
	bulletScene = preload("res://scene/weapons/parts/bullets/Bullet.tscn")

var current_bullet_num = bulletVolume
var reload_start_time = 0

func _process(delta):
	if reloading:
		reload_start_time += delta
		if reload_start_time >= reloadTime:
			reloadStarTime = 0
			reload()
			reloading = false

func reload():
	remainBulletNum = bulletVolume

func applyBullet():
	if remainBulletNum >= 0:
		return bulletScene.instance()




