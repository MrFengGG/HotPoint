extends Reference

var item_datas = load("res://scene/items/ItemData.gd").ITEM_DATAS
var weaponFactory = WeaponFactory.new()

class_name ItemFactory

func create(item):
	if item.itemType == 0:
		return weaponFactory.createWeapon(item.data)
	return null

func recover(node, item):
	if item.itemType == 0:
		weaponFactory.recoverWeapon(node,item)

func query(code):
	var item_data = item_datas[code]
	if item_data:
		return Item.new(item_data['icon'], item_data['name'], item_data['desc'], item_data['itemType'], item_data['data'])
	return false
