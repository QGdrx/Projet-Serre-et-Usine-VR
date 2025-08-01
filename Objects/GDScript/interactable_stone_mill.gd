extends Node3D

@onready var vp2D3D : XRToolsViewport2DIn3D = $Viewport2Din3D
@onready var vp : Viewport = $Viewport2Din3D/Viewport
@onready var area : XRToolsInteractableArea = $XRToolsInteractableArea
@onready var camera : Camera3D = get_viewport().get_camera_3d()


func _ready() -> void :
	vp2D3D.visible = false


func interact() -> void:
	vp2D3D.visible = true

# Check si on est toujours dans la HitBox, si non l'écran disparait
func exit_interaction() -> void:
	if vp2D3D.visible == true :
		vp2D3D.visible = false
		InteractionManager.check_interactions()


# Fonction qui check si l'interaction avec l'objet est toujours en cours et renvoie true si oui
func check_interaction() -> bool :
	if vp2D3D.visible == true :
		return true
	else : 
		return false


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Grosse_animation" :
		const results = preload("res://Objects/Scenes/menu/canvas_results.tscn")
		for child in vp.get_children():
			child.queue_free()
		vp.add_child(results.instantiate())
		
	get_node("Viewport2Din3D2/Viewport").get_child(0).get_child(0).on_anim_end(anim_name)
