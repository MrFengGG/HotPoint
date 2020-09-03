extends Node2D

onready var timer = $Timer
onready var inventory = $CanvasLayer/Inventory
onready var player = $Player
var calender = Calender.new()

func _ready():
	inventory.connect("change_tool_item", player, "change_tool_item")
	timer.connect("timeout", calender, "tick")

func onHourChange(hour):
	pass
