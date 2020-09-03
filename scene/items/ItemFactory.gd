extends Reference

var item_datas = ItemData.ITEM_DATAS

var weaponFactory = WeaponFactory.new()
class_name ItemFactory

func produce(item):
	if item.item_type == ItemData.ITEM_TYPE.WEAPON:
		return weaponFactory.createWeapon(item)
	return null

func recover(node, item):
	if item.itemType == item_datas.ITEM_TYPE.WEAPON:
		weaponFactory.recoverWeapon(node,item)

func query(code):
	var item_data = item_datas[code]
	if item_data:
		return Item.new(item_data['icon'], item_data['name'], item_data['desc'], item_data['itemType'], item_data['data'])
	return false
