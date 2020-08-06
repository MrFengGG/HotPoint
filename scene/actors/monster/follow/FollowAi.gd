extends "res://scene/actors/monster/MonsterAI.gd"

var target = null
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

func attack(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
