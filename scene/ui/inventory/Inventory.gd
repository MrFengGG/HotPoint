extends Control

var item_factory = ItemFactory.new()

signal change_tool_item(tool_node, item)

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
	if Input.is_action_pressed("ui_tool1"):
		change_tool_item(0)
	if Input.is_action_pressed("ui_tool2"):
		change_tool_item(1)
	if Input.is_action_pressed("ui_tool3"):
		change_tool_item(2)
	if Input.is_action_pressed("ui_tool4"):
		change_tool_item(3)
	if Input.is_action_pressed("ui_tool5"):
		change_tool_item(4)
	if Input.is_action_pressed("ui_tool6"):
		change_tool_item(5)
	if Input.is_action_pressed("ui_tool7"):
		change_tool_item(6)
	if Input.is_action_pressed("ui_tool8"):
		change_tool_item(7)
		
func change_tool_item(index):
	var slot = tool_bar.get_slot(index)
	if slot:
		if slot.get_item():
			var tool_node = item_factory.produce(slot.get_item())
			emit_signal("change_tool_item", tool_node, slot.get_item())
		else:
			emit_signal("change_tool_item", null)
		
	




	
	


