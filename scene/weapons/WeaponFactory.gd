extends Reference

class_name WeaponFactory

var weaponScene = preload("res://scene/weapons/Weapon.tscn")

var closeBarrelScene = preload("res://scene/weapons/parts/barrels/close/CloseBarrel.tscn")

var gunBarrelScene = preload("res://scene/weapons/parts/barrels/gun/GunBarrel.tscn")

const weaponDatas = preload("res://scene/datas/weaponData.gd")

func createWeapon(data):
    var weaponNode = weaponScene.instance()
    #init trigger
    if data.triggerType == 1:
        weaponNode.trigger = ContinuityTrigger.new()
    else if data.triggerType == 2:
        weaponNode.trigger = intervalTrigger.new()

    #init barrel
    if data.barrelType == 1:
        var barrel = closeBarrelScene.instance()
        barrel.spirite.texture = preload(item.barrelTexturePath)
        weaponNode.barrel = barrel
    
    else if data.barrelType = 2:
        var barrel = gunBarrelScene.instance()
        barrel.spirite.texture = preload(item.barrelTexturePath)
        weaponNode.barrel = barrel
    
    #init clip
    if data.clipType == 1:
        weaponNode.clip = CloseClip.new()
    if data.clipType == 2:
        weaponNode.clip = InfiniteClip.new()
    if data.clipType == 3:
        weaponNode.clip = LimitedClip.new()
    return weaponNode
func recoverWeapon(weapon, item):
    pass
