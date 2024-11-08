extends CharacterBody2D

@export var spd:int
@export var accel:int
@export var friction:int

var input_direction = Vector2.ZERO

var hearts_list:Array[TextureRect]

func _ready() -> void:
	var hearts_parent = $heart_bar/HBoxContainer
	for child in hearts_parent.get_children():
		hearts_list.append(child)

func _physics_process(delta: float) -> void:
	input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down").limit_length()

	velocity = input_direction * spd

	move_and_slide()

func _on_health_component_health_changed() -> void:
	hearts_update()

func hearts_update():
	for i in range(hearts_list.size()):
		hearts_list[i].visible = i < $health_component.health

	if $health_component.health == 1:
		hearts_list[0].get_child(0).play("beating_heart")
	if $health_component.health > 1:
		hearts_list[0].get_child(0).play("idle")
