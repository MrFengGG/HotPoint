extends Control

class_name Inventory

onready var player_panel = $PlayerPanel
onready var tool_bar = $ToolBar
onready var equopment_bar = $EquipmentBar
onready var store = $Store

func _ready():
	hide_panel()
	player_panel.add_item()
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




	
	


