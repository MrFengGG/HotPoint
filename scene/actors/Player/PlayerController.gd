extends KinematicBody2D

export (int) var speed

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var weapon = $WeaponPviot/Weapon
onready var weaponPviot = $WeaponPviot

var itemFactory = ItemFactory.new()

signal direction_changed(newDirection)

func _ready():
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
	if weapon:
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			weapon.trigger_press()
		else:
			weapon.trigger_release()

