extends Node2D

onready var weapon = $Weapon

func _ready():
	pass

func set_weapon(weapon):
	weapon = weapon

func updatePosition(newDirection):
	if weapon && weapon.canMove():
		#角度
		rotation = newDirection.angle()
		#反转
		scale.y = -1 if newDirection.x < 0 else 1
		#层级修改
		show_behind_parent = newDirection.y < 0
