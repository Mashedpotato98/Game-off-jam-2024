extends Control

func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value/5)

func _on_check_box_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,toggled_on)
