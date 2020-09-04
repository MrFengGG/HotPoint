extends Node2D

export (Array) var grow_stages = []
export (int) var ripe_stage_index = 1
export (int) var dead_stage_index = 1

var ripe = false
var dead = false
var alive_day = 0
var current_stage = 0

onready var bodySprite = $BodySprite
onready var shadowSprite = $ShadowSprite

func _ready():
	add_to_group("plant")
	
func on_next_day():
	alive_day += 1
	for i in range(grow_stages):
		if alive_day <= grow_stages[i].day && current_stage != i:
			change_to_stage(grow_stages[i])
			current_stage = i
			if current_stage == ripe_stage_index:
				ripe = true
			if current_stage == dead_stage_index:
				dead = false
				ripe = false

func change_to_stage(stage : GrowStage):
	bodySprite.texture = load(stage.body_texture_path)
	shadowSprite.texture = load(stage.shadow_texture_path)
	
func init(ripe_stage_index, dead_stage_index, grow_stages):
	self.ripe_stage_index = ripe_stage_index
	self.dead_stage_index = dead_stage_index
	self.grow_stages = grow_stages

			
