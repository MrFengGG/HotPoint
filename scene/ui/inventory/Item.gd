extends TextureRect

signal toolItem(itemData)
class_name Item

var itemData

func _init(itemData):
	texture = load(itemData.icon)
	self.itemData = itemData
	



