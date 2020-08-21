extends Reference

var weaponFactory = WeaponFactory.new()

class_name ItemFactory

func create(item):
	if item.itemType == 0:
		return weaponFactory.createWeapon(item.data)
	return null
func recover(node, item):
	if item.itemType == 0:
		weaponFactory.recoverWeapon(node,item)
