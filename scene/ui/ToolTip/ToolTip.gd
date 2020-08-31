extends Panel
onready var textLabel = $RichTextLabel

func _ready():
	hide()

func showText(position, title, text):
	self.set_position(position)
	textLabel.bbcode_text = title + "\n" + text
	show()


