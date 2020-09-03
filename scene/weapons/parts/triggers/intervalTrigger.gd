extends Trigger

class_name IntervalTrigger

export (float) var distance = 1

var last_shoot_spend = 0
var trigger_pressed = false

func trigger_press():
	if !trigger_pressed && last_shoot_spend >= distance:
		last_shoot_spend = 0
		trigger_pressed = true
		emit_signal("fire", WeaponEffect.new())

func trigger_release():
	trigger_pressed = false

func _process(delta):
	last_shoot_spend += delta
