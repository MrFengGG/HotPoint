extends Node2D

onready var trigger = $Trigger
onready var clip = $Clip
onready var barrel = $Barrel

func triggerPress():
	trigger.triggerPress()

func triggerRelease():
	trigger.triggerRelease()

func onFire(weaponEffect):
	var bullet = clip.applyBullet()
	if bullet:
		bullet = weaponEffect.effectBullet(bullet)
		barrel.fire(bullet, weaponEffect)
	
