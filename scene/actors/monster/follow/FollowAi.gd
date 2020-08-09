extends "res://scene/actors/monster/MonsterAI.gd"

var target = null
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	var players = get_tree().get_nodes_in_group("players")
	if players.size() > 0:
		target = players[0]

func move(delta):
	if target:
		var direction = (target.position - position).normalized()
		var velocity = direction * delta * speed
		position += velocity
		
		animationTree.set("parameters/Idle/blend_position", velocity)
		animationTree.set("parameters/Walk/blend_position", velocity)
		
		if velocity.length() > 0:
			animationState.travel("Walk")
		else:
			animationState.travel("Idle")

func attack(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
