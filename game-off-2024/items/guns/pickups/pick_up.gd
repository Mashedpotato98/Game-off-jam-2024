extends Node 
class_name pickup

@export var item_packed:PackedScene

var item

func _ready() -> void:
	item = item_packed.instantiate()
	print(item)
