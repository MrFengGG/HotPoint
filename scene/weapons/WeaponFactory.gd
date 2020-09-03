extends Reference

var wave_weapon_scene = preload("res://scene/weapons/wave/WaveWeapon.tscn")
class_name WeaponFactory

func createWeapon(item):
	var weapon
	if item.item_data.weaponType == ItemData.WEAPON_TYPE.SWORD:
		weapon = wave_weapon_scene.instance()
		weapon.init(item)
	if weapon:
		return weapon
	return false

func recoverWeapon(weapon, item):
	pass
