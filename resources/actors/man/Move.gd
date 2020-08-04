extends KinematicBody2D

export (int) var speed

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var pistol = $Pistol

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var velocity = Vector2.ZERO
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	var direction = (get_global_mouse_position() - position)
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		pistol.attack(delta, direction)
	animationTree.set("parameters/Idle/blend_position", direction)
	animationTree.set("parameters/Walk/blend_position", direction)
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		animationState.travel("Walk")
	else:
		animationState.travel("Idle")
	move_and_slide(velocity)
