extends Reference

var weaponScene = preload("res://scene/weapons/Weapon.tscn")

var closeBarrelScene = preload("res://scene/weapons/parts/barrels/close/CloseBarrel.tscn")

var gunBarrelScene = preload("res://scene/weapons/parts/barrels/gun/GunBarrel.tscn")

class_name WeaponFactory

func createWeapon(data):
	var weaponNode = weaponScene.instance()
	#init trigger
	if data['triggerType'] == 1:
		weaponNode.trigger = ContinuityTrigger.new()
	elif data['triggerType'] == 2:
		weaponNode.trigger = IntervalTrigger.new()

	#init barrel
	if data['barrelType'] == 1:
		var barrel = closeBarrelScene.instance()
		barrel.spirite.texture = load(data['barrelTexturePath'])
		weaponNode.barrel = barrel
	elif data['barrelType'] == 2:
		var barrel = gunBarrelScene.instance()
		barrel.spirite.texture = load(data['barrelTexturePath'])
		weaponNode.barrel = barrel
	
	#init clip
	if data['clipType'] == 1:
		weaponNode.clip = CloseClip.new()
	if data['clipType'] == 2:
		weaponNode.clip = InfiniteClip.new()
	if data['clipType'] == 3:
		weaponNode.clip = LimitedClip.new()
	return weaponNode
func recoverWeapon(weapon, item):
	pass
