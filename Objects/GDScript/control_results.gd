extends Control
@onready var label : Label = $PanelContainer/VBoxContainer/HBoxContainer2/MarginContainer2/Label2
const simulation = preload("res://Objects/Scenes/menu/canvas_stonemill_simulation_parameters.tscn")




func _ready() -> void :
	if InteractionManager.copea_seed == true :
		if InteractionManager.scenario1 == true :
			label.text = "Dehulled Seeds : 0.4 (kg)

			Undehulled Seeds : 0.4 (kg)"
		else : 
			label.text = "Dehulled Seeds : 1.3 (kg)

			Undehulled Seeds : 0.3 (kg)"
	else :
		if InteractionManager.scenario1 == true :
			label.text = "Dehulled Seeds : 0.2 (kg)

			Undehulled Seeds : 0.8 (kg)"
		else : 
			label.text = "Dehulled Seeds : 0.1 (kg)

			Undehulled Seeds : 0.6 (kg)"


func _on_button_pressed() -> void:
	var vp = get_parent().get_parent()
	for child in vp.get_children():
		child.queue_free()
	vp.add_child(simulation.instantiate())
