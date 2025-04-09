extends Control

#region variables
var guns:Array = [{"name":"m4","load":preload("res://items/guns/gun-scenes/m_714.tscn"),"icon":"res://icon.svg"},
				  {"name":"Rovington","load":preload('res://items/guns/gun-scenes/rovington_781.tscn'),"icon":"res://assets/Heart/Heart/Heart.png"}]

@onready var gun_list:ItemList = $Shop_list
@onready var bought_list:ItemList = $Bought_list
@onready var bought_list_grid:GridContainer = $GridContainer

var guns_selected:Array = []
#endregion

func _ready() -> void:
	for i in range(guns.size()): 
		var gun_to_add = guns[i]
		gun_list.add_item(gun_to_add["name"],load(gun_to_add["icon"]))
		gun_list.set_item_metadata(i,gun_to_add['load'])

#region signals
func _on_buy_pressed() -> void:
	if guns_selected != []:
		for i in guns_selected:
			Global.weapons_bought.append(i)
		guns_selected.clear()

func _on_item_list_multi_selected(index: int, selected: bool) -> void:
	guns_selected.append(gun_list.get_item_metadata(index))
	bought_list.add_item(guns[index]['name'],load(guns[index]['icon']))
	var sprite:Sprite2D = Sprite2D.new()
	sprite.texture = load(guns[index]['icon'])
	bought_list_grid.add_child(sprite)



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file('res://levels/playable levels/level_1.tscn')

#endregion


func buy(indx:int):
		var bought_weapon:Node2D = gun_list.get_item_metadata(indx).instantiate()
		Global.weapons_bought.append(bought_weapon)
