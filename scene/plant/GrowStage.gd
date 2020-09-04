extends Node

class_name GrowStage

var day
var body_texture_path
var shadow_texture_path

func _init(day, texture_path):
	self.day = day
	self.texture_path = texture_path
