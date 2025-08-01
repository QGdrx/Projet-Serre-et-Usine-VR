extends MeshInstance3D

@onready var area : XRToolsInteractableArea = $XRToolsInteractableArea
@onready var camera : Camera3D = get_viewport().get_camera_3d()
@onready var rotate_point : Node3D = $RotatePoint
@onready var label : Label3D = $RotatePoint/Dehuller_Close/Label3D
@onready var music : AudioStreamPlayer3D = $"../AudioStreamPlayer3D"

var original_point_pos : Vector3
var audio_playing : bool = false

func _ready():
	rotate_point.visible = false
	original_point_pos = rotate_point.global_transform.origin
	audio_playing = false

func interact() -> void:
	rotate_point.visible = true


func _process(_delta: float) -> void:
	if not rotate_point.visible:
		return
	
	var cam_pos : Vector3 = camera.global_transform.origin
	var new_pos : Vector3 = original_point_pos.lerp(cam_pos, 0.5)
	var t = rotate_point.global_transform
	t.origin = new_pos
	rotate_point.global_transform = t
	rotate_point.rotate(Vector3.UP, 0.03)
	
	var label_pos : Vector3 = label.global_transform.origin
	label.look_at_from_position(label_pos, cam_pos, Vector3.UP)
	label.scale = Vector3(-1, 2, 1)
	
	if audio_playing == false :
		music.play()
		audio_playing = true


# Check si on est toujours dans la HitBox, si non l'objet disparait
func exit_interaction() -> void :
	if rotate_point.visible == true :
		rotate_point.visible = false
		InteractionManager.check_interactions()
		music.stop()
		audio_playing = false

# Fonction qui check si l'interaction avec l'objet est toujours en cours et renvoie true si oui
func check_interaction() -> bool :
	if rotate_point.visible == true :
		return true
	else :
		return false
