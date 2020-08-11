extends "res://scene/weapons/parts/clips/Clip.gd"

export (float) var bulletVolume = 1
export (float) var reloadTime = 1
export var currentBulletType = "normal"

var reloadStarTime = 0;
var reloading = false
var bulletScene
var remainBulletNum

func _ready():
	bulletScene = preload("res://scene/weapons/parts/bullets/Bullet.tscn")

var currentBulletNum = bulletVolume
var reloadStartTime = 0

func _process(delta):
	if reloading:
		reloadStarTime += delta
		if reloadStarTime >= reloadTime:
			reloadStarTime = 0
			reload()
			reloading = false

func reload():
	remainBulletNum = bulletVolume

func applyBullet():
	if remainBulletNum >= 0:
		return bulletScene.instance()




