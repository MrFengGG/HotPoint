extends Node2D

var close_barrel_scene = preload("res://scene/weapons/parts/barrels/close/CloseBarrel.tscn")
var gun_barrel_scene = preload("res://scene/weapons/parts/barrels/gun/GunBarrel.tscn")
onready var trigger
onready var clip
onready var barrel

class_name Weapon

var item

func _ready():
	var data = item.item_data
	#init trigger
	if data['triggerType'] == 1:
		self.trigger = ContinuityTrigger.new()
	elif data['triggerType'] == 2:
		self.trigger = IntervalTrigger.new()
	add_child(self.trigger)

	#init barrel
	if data['barrelType'] == 1:
		var barrel = close_barrel_scene.instance()
		barrel.init(data['barrelTexturePath'])
		self.barrel = barrel
	elif data['barrelType'] == 2:
		var barrel = gun_barrel_scene.instance()
		barrel.spirite.texture = load(data['barrelTexturePath'])
		self.barrel = barrel
	add_child(self.barrel)
	#init clip
	if data['clipType'] == 1:
		self.clip = CloseClip.new()
	if data['clipType'] == 2:
		self.clip = InfiniteClip.new()
	if data['clipType'] == 3:
		self.clip = LimitedClip.new()
	add_child(self.clip)

func trigger_press():
	trigger.trigger_press()

func trigger_release():
	trigger.trigger_release()

func on_fire(weaponEffect):
	var bullet = clip.apply_bullet()
	if bullet:
		bullet = weaponEffect.effectBullet(bullet)
		barrel.fire(bullet, weaponEffect)

func canMove():
	return barrel.fire_is_over()

func _init(weapon_item):
	self.item = weapon_item
