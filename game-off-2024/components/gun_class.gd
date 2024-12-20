
extends Node
class_name gun_class

@export var gun:Node2D

@export var bullet:PackedScene
@export var muzzle:Marker2D
@export var anim:AnimationPlayer

@export var bullet_count:int
@export var arc:int
@export_range(0,50) var fireRate

var recoil_angle = 0.0
@export var max_recoil:int

var can_shoot:bool = true
var reloading:bool = false

@export var total_ammo:int
var mag_ammo:int
@export var max_mag_ammo:int


var offset:Vector2 = Vector2(0, 0)
var radius = 30

func _ready() -> void:
	mag_ammo = max_mag_ammo

func fire(direction):
	if can_shoot == true:
		can_shoot = false
		anim.play("shoot")
		for i in bullet_count:
			var bullet_ins = bullet.instantiate()
			bullet_ins.position = muzzle.global_position

			if bullet_count == 1:
				bullet_ins.rotation = direction
			else:
				var arc_rad = deg_to_rad(-arc)
				var increment = arc_rad / (bullet_count - 1)
				bullet_ins.global_rotation = (
					direction + 
					increment * i - 
					arc_rad / 2 
				)
			get_tree().root.call_deferred("add_child",bullet_ins)
		await get_tree().create_timer(1 / fireRate).timeout
		can_shoot = true
		mag_ammo -= bullet_count

func reload():
	if mag_ammo < max_mag_ammo and reloading == false:
		reloading = true
		can_shoot = false
		var ammo_needed = max_mag_ammo - mag_ammo
		ammo_needed = min(ammo_needed, total_ammo)

		mag_ammo = min(mag_ammo + ammo_needed, max_mag_ammo)
		total_ammo -= ammo_needed
		reloading = false
		can_shoot = true
