extends VBoxContainer

var gridHeight = 40
var gridWidth = 40
var distance = 3
var weaponData = load("res://scene/datas/WeaponData.gd").weaponData
var toolTip = get_tree().root().getNode("ToolTip")
class_name ItemContainer

export (int) var height = 1
export (int) var width = 1
export (String) var localName
export (float) var itemSize
export (Vector2) var position

var slots = []

func _ready():
	var label = Label.new()
	label.text = localName
	add_child(label)
	var gridContainer = GridContainer.new()
	for i in range(height):
		var row = HBoxContainer.new()
		for j in range(width):
			var cell = ItemSlot.new()
			cell.color = Color.white
			cell.rect_size = Vector2(gridWidth, gridHeight)
			cell.rect_min_size = Vector2(gridWidth, gridHeight)
			cell.connect("mouse_entered", self, "showToolTip", [cell]);
			cell.connect("mouse_exited", self, "hideToolTlp", [cell]);
			row.add_child(cell)
			slots.append(cell)
		gridContainer.add_child(row)
	add_child(gridContainer)
	for i in range(2):
		var slot = getFreeSlot()
		if slot:
			slot.setItem(weaponData['w1'])

func showToolTip(slot):
	if slot.getItem():
		var item = slot.getItem()
		var position = get_global_mouse_position()
		toolTip.showText(position, item.name, item.desc)

func hideToolTlp(slot):
	toolTip.hide()
	
func addItem(item):
	var slot = getFreeSlot()
	if slot:
		slot.setItem(weaponData['w1'])

func getFreeSlot():
	for i in slots:
		if !i.getItem():
			return i
	return false
	
func _init(position = Vector2(0,0), height = 10, width=10, name='hellow'):
	self.height = height
	self.width = width
	self.position = position
	self.localName = name



