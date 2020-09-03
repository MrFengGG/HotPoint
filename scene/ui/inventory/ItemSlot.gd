extends Control

class_name ItemSlot

onready var itemContainer = $ItemContainer

var item

func _ready():
	pass

func get_item():
	return item

func set_item(item):
	if item:
		itemContainer.texture = load(item.item_icon)
	self.item = item

func remove_item():
	item = null

func pick_item():
	if item:
		itemContainer.texture = null
		var temp = item
		item = null
		return temp
	return false
