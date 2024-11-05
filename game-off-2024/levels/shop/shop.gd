extends Control


var guns:Array = [{"name":"m4","path":"res://guns/m_714/m_714.tscn","icon":"res://icon.svg"}]
var selected:bool = false
var gun_selected:String
var guns_selected:int = 0

@onready var gun_list:ItemList = $ItemList

func _process(delta: float) -> void:
	if guns_selected >= 2:
		print("aloo")

func _ready() -> void:
	for i in range(guns.size()):
		var gun_to_add = guns[i]
		gun_list.add_item(gun_to_add["name"],load(gun_to_add["icon"]))

func _on_item_list_item_selected(index: int) -> void:
	selected = true
	gun_selected = gun_list.get_item_text(index)

func _on_buy_pressed() -> void:
	if selected == true:
		Global.weapons_bought.append({"item_location":"res://guns/all_guns/" + 
		str(gun_selected) + ".tscn"})
		guns_selected += 1
