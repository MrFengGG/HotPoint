extends Reference

class_name ItemFactory

var weaponFactory = WeaponFactory.new()


func create(item):
    if item.itemType == 0:
        return weaponFactory.createWeapon(item.data)
    return null

func recover(node, item):
    if item.itemType == 0:
        recoverWeapon.recoverWeapon(node, item)
