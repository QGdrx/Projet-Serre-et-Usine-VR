extends MeshInstance3D

@onready var screen : XRToolsViewport2DIn3D = $screen_explanation_dehuller/Viewport2Din3D
@onready var area : XRToolsInteractableArea = $XRToolsInteractableArea
@onready var camera : Camera3D = get_viewport().get_camera_3d()


func _ready() -> void :
	screen.visible = false


func interact() -> void:
	screen.visible = true


func _process(_delta) :
	if screen.visible == true :
		var obj_pos = area.global_transform.origin
		var cam_pos = camera.global_transform.origin

		var cam_dir = (cam_pos - obj_pos).normalized()
		var cam_yaw = atan2(cam_dir.x, cam_dir.z)

		var orbit_radius := 1
		var screen_angle = cam_yaw + PI * 0.5
		var offset = Vector3(sin(screen_angle), 0, cos(screen_angle)) * orbit_radius
		var screen_pos = obj_pos + offset + Vector3(0,0.2,0)

		var pull_strength := 0.2
		screen_pos = screen_pos.lerp(cam_pos, pull_strength)

		var min_cam_distance := 0.65
		if screen_pos.distance_to(cam_pos) < min_cam_distance:
			var back_dir = (screen_pos - cam_pos).normalized()
			screen_pos = cam_pos + back_dir * min_cam_distance

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
