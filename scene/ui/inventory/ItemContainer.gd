extends Container

var gridHeight = 40
var gridWidth = 40
var distance = 3

class_name ItemContainer
export (int) var height = 1
export (int) var width = 1
export (String) var localName
export (float) var itemSize
export (Vector2) var position

var items = []
func _ready():
	var label = Label.new()
	label.text = localName
	
	add_child(label)
	var gridContainer = GridContainer.new()
	for i in range(height):
		var row = HBoxContainer.new()
		for j in range(width):
			var cell = ColorRect.new()
			cell.color = Color.white
			cell.rect_size = Vector2(gridWidth, gridHeight)
			cell.rect_min_size = Vector2(gridWidth, gridHeight)
			row.add_child(cell)
		gridContainer.add_child(row)
	add_child(gridContainer)

func nextItem():
	pass

func switchItem(position):
	pass

func chooseItem(index):
	pass

func addItem(item):
	pass

func removeItem(position, index):
	pass
	
func _init(position = Vector2(0,0), height = 10, width=10, name='hellow'):
	self.height = height
	self.width = width
	self.position = position
	self.localName = name



