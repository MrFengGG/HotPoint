extends Node

class_name Item

var item_icon
var item_name
var item_desc
var item_type
var item_data

func _init(item_icon, item_name, item_desc, item_type, item_data):
	self.item_icon = item_icon
	self.item_name = item_name
	self.item_desc = item_desc
	self.item_type = item_type
	self.item_data = item_data


