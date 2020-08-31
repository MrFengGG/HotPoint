extends Node

class_name Inventory

var toolPannel
var knapsack
var equipmentBar

func _ready():
	toolPannel = ItemContainer.new(Vector2(1,1),1, 10)
	add_child(toolPannel)
	
	


