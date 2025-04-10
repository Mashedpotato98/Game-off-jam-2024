extends Node


#region onready variables
@onready var health_component:healthComponent = $"../health_component"
@onready var hearts_parent:HBoxContainer = $ui/HBoxContainer
@onready var weapon_manager:Node = $"../weapon_manager"
@onready var ammo_count:Label = $ui/ammo
#endregion

#region health
var hearts_list:Array = []
#endregion

func _ready() -> void:
	update_ammo_count()
	for i in hearts_parent.get_children():
		hearts_list.append(i)

func hearts_update():
	for i in range(hearts_list.size()):
		hearts_list[i].visible = i < health_component.health

	if health_component.health == 1:
		hearts_list[0].get_child(0).play("beating_heart")
	if health_component.health > 1:
		hearts_list[0].get_child(0).play("idle")

func update_ammo_count():
	ammo_count.text = str(weapon_manager.current_weapon.mag_ammo) + "/" + str(weapon_manager.current_weapon.total_ammo)

func _on_health_component_health_changed() -> void:
	hearts_update()
