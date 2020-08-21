extends Reference
enum ItemType { WEAPON }
class_name ItemMeta

var uid
var icon
var desc
var weight
var name
var level
var itemType
var stackable
var stackNum
var data

func _init(id, icon, desc, weight, name, itemType, stackable, stackNum, data):
	self.id = id
	self.icon = icon
	self.desc = desc
	self.weight = weight
	self.name = name
	self.level = 1
	self.itemType = itemType
	self.stackable = stackable
	self.stackNum = stackNum
	self.data = data
	
	

