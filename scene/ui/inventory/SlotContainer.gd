extends Control

onready var container = $Slots
var slots = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in container.get_children():
		slots.append(i)

func get_slots():
	return slots

func get_free_slot():
	for i in slots:
		if !i.get_item():
			return i
	return false

func add_item(item):
	var item_slot = get_free_slot()
	if item_slot:
		item_slot.set_item(item)
