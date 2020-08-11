extends "res://scene/weapons/parts/Trigger.gd"

export (float) var distance = 1

var lastShootSpend = 0

var triggerPressed = false

func triggerPress():
    triggerPressed = true

func triggerRelease():
    triggerPressed = false

func _process(delta):
    lastShootSpend += delta
    if triggerPressed && lastShootSpend >= distance:
        lastShootSpend = 0
        emit("fire", WeaponEffect.new())
