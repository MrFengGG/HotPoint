extends Control

var item_factory = ItemFactory.new()
class_name Inventory

onready var player_panel = $PlayerPanel
onready var tool_bar = $ToolBar
onready var equopment_bar = $EquipmentBar
onready var store = $Store

onready var tooltip = $ToolTip

var holding_item
var holding_slot
var temp_item_container = ItemContainer.new()

func _ready():
	temp_item_container.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(temp_item_container)
	temp_item_container.hide()
	for i in player_panel.get_slots():
		i.connect("mouse_entered", self, "show_tooltip", [i])
		i.connect("mouse_exited", self, "hide_tooltip", [i])
		i.connect("gui_input", self, "on_slot_gui_input", [i])
	for i in tool_bar.get_slots():
		i.connect("gui_input", self, "on_slot_gui_input", [i])
	for i in equopment_bar.get_slots():
		i.connect("mouse_entered", self, "show_tooltip", [i])
		i.connect("mouse_exited", self, "hide_tooltip", [i])
		i.connect("gui_input", self, "on_slot_gui_input", [i])
	for i in store.get_slots():
		i.connect("mouse_entered", self, "show_tooltip", [i])
		i.connect("mouse_exited", self, "hide_tooltip", [i])
		i.connect("gui_input", self, "on_slot_gui_input", [i])
	hide_panel()
	hide_store(null)
	tool_bar.add_item(item_factory.query("w1"))
	store.add_item(item_factory.query("w1"))

func hide_store(container):
	store.clear()
	store.visible = false

func show_store(container):
	store.replace_item(container)
	show_panel()

func hide_panel():
	player_panel.visible = false
	equopment_bar.visible = false

func show_panel():
	player_panel.visible = true
	equopment_bar.visible = true

func toggle_panel():
	player_panel.visible = !player_panel.visible
	equopment_bar.visible = !equopment_bar.visible
	
func show_tooltip(slot):
	if slot.get_item():
		tooltip.show_item(get_global_mouse_position(), slot.get_item())
	
func hide_tooltip(slot):
	tooltip.hide_item()
	
func on_slot_gui_input(event : InputEvent, slot : ItemSlot):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			if holding_item:
				var item = slot.pick_item()
				temp_item_container.texture = null
				holding_slot.set_item(item)
				slot.set_item(holding_item)
				
				holding_item = null
				holding_slot = null
			else:
				var item = slot.pick_item()
				if item:
					holding_slot = slot
					holding_item = item
					temp_item_container.show()
					temp_item_container.texture = load(item.item_icon)

func _input(event : InputEvent):
	if event is InputEventMouse:
		temp_item_container.rect_position = event.global_position
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT && event.pressed:
			if holding_item:
				temp_item_container.texture = null
				holding_slot.set_item(holding_item)
				holding_slot = null
				holding_item = null
func _process(delta):

	if Input.is_action_just_released("ui_panel_toggle"):
		toggle_panel()
	




	
	


