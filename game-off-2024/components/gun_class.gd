
extends item_class
class_name gun_class

@export var bullet:PackedScene
@export var muzzle:Marker2D

#region shooting variables
@export var bullet_count:int
@export var arc:int
@export_range(0,50) var fireRate

@export var max_recoil:int
var recoil_angle = 0.0
#endregion

#region can do something
var can_shoot:bool = true
var reloading:bool = false
#endregion

#region ammo variables
@export var total_ammo:int
@export var max_mag_ammo:int
@export_range(0,50) var reload_time
var mag_ammo:int
#endregion

#region misc/no idea 
var offset:Vector2 = Vector2(0, 0)
var radius = 30
#endregion

func _ready() -> void:
	mag_ammo = max_mag_ammo

func fire(direction):
	if can_shoot == true and mag_ammo > 0:
		can_shoot = false
		if mag_ammo <= bullet_count:
			bullet_count = mag_ammo
		mag_ammo -= bullet_count
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

func reload():
	if mag_ammo < max_mag_ammo:
		reloading = true
		can_shoot = false

		var ammo_needed = max_mag_ammo - mag_ammo
		ammo_needed = min(ammo_needed, total_ammo)

		#await get_tree().create_timer(reload_time).timeout

		mag_ammo += ammo_needed
		total_ammo -= ammo_needed
		reloading = false
		can_shoot = true
