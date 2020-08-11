extends "res://scene/weapons/parts/clips/Clip.gd"

export var currentBulletType = "normal"

func _ready():
    bulletScene = preload(currentBulletType)

func applyBullet():
    return bulletScene.instance()