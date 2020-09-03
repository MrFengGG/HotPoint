extends Control

onready var title = $Title
onready var content = $Content

func _ready():
	visible = false

func show_item(position, item):
	self.set_position(position)
	title.text = item.item_name
	content.bbcode_text = item.item_desc
	visible = true

func hide_item():
	visible = false
