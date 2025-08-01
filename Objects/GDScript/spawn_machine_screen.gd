extends MeshInstance3D

@onready var screen : XRToolsViewport2DIn3D = $Viewport2Din3D
@onready var area : XRToolsInteractableArea = $XRToolsInteractableArea
@onready var camera : Camera3D = get_viewport().get_camera_3d()


func _ready() -> void :
	screen.visible = false


func interact() -> void:
	screen.visible = true


func _process(_delta):
	if screen.visible == true :
		var obj_pos = area.global_transform.origin
		var cam_pos = camera.global_transform.origin
		var dir3d = (cam_pos - obj_pos).normalized()
		
		#  Distance du texte à l'objet
		var orbit_radius : float = 0.9
		var min_cam_distance : float = 0.75
		var screen_pos = obj_pos + dir3d * orbit_radius
		var distance_to_cam = screen_pos.distance_to(cam_pos)
		
		if distance_to_cam < min_cam_distance:
			var correction_dir = (screen_pos - cam_pos).normalized()
			screen_pos = cam_pos + correction_dir * min_cam_distance

		screen.look_at_from_position(screen_pos, cam_pos, Vector3.UP)
		screen.scale = Vector3(-1, 1, 1)


# Check si on est toujours dans la HitBox, si non l'écran disparait
func exit_interaction() -> void:
	if screen.visible == true :
		screen.visible = false
		InteractionManager.check_interactions()


# Fonction qui check si l'interaction avec l'objet est toujours en cours et renvoie true si oui
func check_interaction() -> bool :
	if screen.visible == true :
		return true
	else : 
		return false
