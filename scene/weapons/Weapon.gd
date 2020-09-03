extends Node2D

var trigger
var clip

onready var barrel = $Barrel

var item

func _ready():
	var data = self.item.item_data
	if data['weaponType'] == ItemData.WEAPON_TYPE.SWORD:
		barrel.get_node("Sprite").texture = load(data['weaponTexturePath'])
	#init trigger
	if data['triggerType'] == 1:
		self.trigger = ContinuityTrigger.new()
	elif data['triggerType'] == 2:
		self.trigger = IntervalTrigger.new()
	self.trigger.connect("fire", self, "on_fire")
	
	add_child(self.trigger)
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
		bullet = weaponEffect.effect_bullet(bullet)
		barrel.fire(bullet, weaponEffect)

func canMove():
	return barrel.fire_is_over()

func init(weapon_item):
	self.item = weapon_item
