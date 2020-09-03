extends Node2D

class_name Weapon

onready var trigger = $Trigger
onready var clip = $Clip
onready var barrel = $Barrel

func trigger_ress():
	trigger.trigger_press()

func trigger_elease():
	trigger.trigger_release()

func on_fire(weaponEffect):
	var bullet = clip.apply_bullet()
	if bullet:
		bullet = weaponEffect.effectBullet(bullet)
		barrel.fire(bullet, weaponEffect)

func canMove():
	return barrel.fire_is_over()
