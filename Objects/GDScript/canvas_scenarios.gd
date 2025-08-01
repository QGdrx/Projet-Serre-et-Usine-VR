extends Control

const results = preload("res://Objects/Scenes/menu/canvas_results.tscn")
@onready var anim : AnimationPlayer
@onready var color_rect


func _ready() -> void :
	anim = get_parent().get_parent().get_parent().get_parent().get_node("AnimationPlayer")
	color_rect = get_parent().get_parent().get_parent().get_parent().get_node("Viewport2Din3D2/Viewport/canvas_animation_selection/Control_animation_selection/PanelContainer/MarginContainer/ColorRect")


func _on_button_scenario_1_pressed() -> void:
	InteractionManager.scenario1 = true
	anim.play("Grosse_animation")
	color_rect.color = Color(255,0,0)
	InteractionManager.reinteract()


func _on_button_scenario_2_pressed() -> void:
	InteractionManager.scenario1 = false
	anim.play("Grosse_animation")
	color_rect.color = Color(255,0,0)
	InteractionManager.reinteract()
