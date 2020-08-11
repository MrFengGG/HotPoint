extends "res://scene/weapons/parts/Trigger.gd"

export (float) var distance = 1

var lastShootSpend = 0
var triggerPressed = false

func triggerPress():
    if !triggerPressed && lastShootSpend >= distance:
        lastShootSpend = 0
        triggerPressed = true
        emit("fire", WeaponEffect.new())

func triggerRelease():
    triggerPressed = false

func _process(delta):
    lastShootSpend += delta