extends Control

const scenarios = preload("res://Objects/Scenes/menu/canvas_scenarios.tscn")

func _on_button_copea_seeds_pressed() -> void:
	InteractionManager.copea_seed = true
	var vp = get_parent().get_parent()
	for child in vp.get_children():
		child.queue_free()
	vp.add_child(scenarios.instantiate())


func _on_button_maize_pressed() -> void:
	InteractionManager.copea_seed = false
	var vp = get_parent().get_parent()
	for child in vp.get_children():
		child.queue_free()
	vp.add_child(scenarios.instantiate())
