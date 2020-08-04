extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bulletScene = load("res://resources/weapon/ammo/bullet/normal/NormalBullet.tscn")
onready var barrel = $Position2D/barrel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func attack(delta, attactDirect):
	rotation = attactDirect.angle()
	if(attactDirect.x < 0):
		scale.y = -1
	else:
		scale.y = 1
	var bullet = bulletScene.instance()
	bullet.position = barrel.global_position
	bullet.direction = attactDirect
	self.get_tree().get_root().add_child(bullet)
	
	
