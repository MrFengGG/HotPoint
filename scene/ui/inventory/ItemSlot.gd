extends Control

class_name ItemSlot
onready var textureRect = $TextureRect

var item

func _ready():
	pass

func get_item():
	return item

func set_item(item):
	if item:
		textureRect.texture = load(item.icon)
	item = item

func remove_item():
	item = null
