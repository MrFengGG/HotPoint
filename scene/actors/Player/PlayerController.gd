extends KinematicBody2D

export (int) var speed

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var weaponPviot = $WeaponPviot
onready var inventory = $Inventory

var equit_weapon

signal direction_changed(newDirection)

func _ready():
	inventory.connect("change_tool_item", self, "change_tool_item")
	add_to_group("players")

func _physics_process(delta):
	_process_move(delta)
	_attact(delta)

#处理运动
func _process_move(delta):
	var velocity = Vector2.ZERO
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var direction = (get_global_mouse_position() - weaponPviot.global_position)

	animationTree.set("parameters/Idle/blend_position", direction)
	animationTree.set("parameters/Walk/blend_position", direction)
	emit_signal("direction_changed", direction)
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		animationState.travel("Walk")
	else:
		animationState.travel("Idle")
	move_and_slide(velocity)

#处理攻击
func _attact(delta):
	if equit_weapon:
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			equit_weapon.trigger_press()
		else:
			equit_weapon.trigger_release()

func change_tool_item(tool_node, item):
	if tool_node:
		if item.item_type == ItemData.ITEM_TYPE.WEAPON:
			if equit_weapon:
				weaponPviot.remove_child(equit_weapon)
			equit_weapon = tool_node
			weaponPviot.add_child(equit_weapon)
		
			

