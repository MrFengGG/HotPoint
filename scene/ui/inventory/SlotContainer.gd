extends Control

onready var container = $Slots
onready var tooltip = get_node("../ToolTip")

var slots = []

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
		
func get_slot(index):
	if slots.size() > index:
		return slots[index]
	return false

func clear():
	for i in slots:
		i.remove_item()

func replace_item(container):
	var target_item_slots = container.get_slots()
	clear()
	for i in range(slots):
		slots[i].set_item(target_item_slots[i].get_item())
		
		
