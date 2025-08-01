extends Control

@onready var area : XRToolsInteractableArea
@onready var anim : AnimationPlayer
@onready var color_rect : ColorRect = $PanelContainer/MarginContainer/ColorRect
var door_opened : bool
var in_an_animation : bool


func _ready() -> void :
	color_rect.color = Color(0,255,0)
	in_an_animation = false
	door_opened = false
	anim = get_parent().get_parent().get_parent().get_parent().get_node("AnimationPlayer")
	area = get_parent().get_parent().get_parent().get_parent().get_node("XRToolsInteractableArea")


func on_anim_end(anim_name : StringName) -> void :
	color_rect.color = Color(0,255,0)
	if anim_name == "Porte_Ouverture" :
		door_opened = true
	if anim_name == "Porte_Fermeture" :
		door_opened = false


func _on_button_machine_opening_pressed() -> void:
	if anim.is_playing() or door_opened == true :
		return
	anim.play("Porte_Ouverture")
	color_rect.color = Color(255,0,0)


func _on_button_machine_closure_pressed() -> void:
	if anim.is_playing() or door_opened == false :
		return
	anim.play("Porte_Fermeture")
	color_rect.color = Color(255,0,0)


func _on_button_valve_pressed() -> void:
	if anim.is_playing() or door_opened == false :
		return
	anim.play("Roue_Translate")
	color_rect.color = Color(255,0,0)


func _on_button_internal_cylinder_pressed() -> void:
	if anim.is_playing() or door_opened == false :
		return
	anim.play("Roue_Tourne")
	color_rect.color = Color(255,0,0)


func _on_button_hatch_opening_pressed() -> void:
	if anim.is_playing() or door_opened == true :
		return
	anim.play("Trappe_Ouverture")
	color_rect.color = Color(255,0,0)


func _on_button_hatch_closure_pressed() -> void:
	if anim.is_playing() or door_opened == true :
		return
	anim.play("Trappe_fermeture")
	color_rect.color = Color(255,0,0)
