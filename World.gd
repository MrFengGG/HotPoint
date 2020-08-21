extends Node2D

onready var timer = $Timer
var calender = Calender.new()

func _ready():
	timer.connect("timeout", calender, "tick")

func onHourChange(hour):
	pass


