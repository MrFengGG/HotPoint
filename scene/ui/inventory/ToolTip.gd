extends Control

onready var title = $Title
onready var content = $Content

func _ready():
	visible = false

func show_item(position, item):
	self.set_position(position)
	title.text = item.title
	content.bbcode_text = item.desc
	visible = true

func hide_item():
	visible = false
