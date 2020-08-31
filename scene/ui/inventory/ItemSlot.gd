extends ColorRect

class_name ItemSlot

export (float) var width
export (float) var height
var item
func _ready():
	rect_size = Vector2(width, height)

func getItem():
	return item
	
func setItem(item):
	if self.item:
		self.item.queue_free()
	self.item = Item.new(item)
	add_child(self.item)



