extends Node2D


var gridHeight = 40
var gridWidth = 40
var distance = 3

class_name GridBar
export (int) var height = 1
export (int) var width = 1

export (String) var localName
export (float) var itemSize

var items = []
func _ready():	
	for i in range(height):
		var row = HBoxContainer.new()
		row.
		row.separation = 2
		

func nextItem():
	pass

func switchItem(position):
	pass

func chooseItem(index):
	pass

func addItem(item):
	pass

func removeItem(position):
	pass



