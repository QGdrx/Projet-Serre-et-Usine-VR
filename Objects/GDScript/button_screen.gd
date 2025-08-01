extends Node3D

@onready var camera : Camera3D = get_viewport().get_camera_3d()
var inmenu : bool = false


func _ready() -> void :
	self.visible = false
	add_to_group("Button_Screen")


func activated() -> void :
	if inmenu == false :
		get_tree().paused = true
		inmenu = true
		
		var cam_pos: Vector3 = camera.global_transform.origin
		var cam_forward : Vector3 = -camera.global_transform.basis.z.normalized()
		var distance = 1
		var menu_pos : Vector3 = cam_pos + cam_forward * distance
		
		global_transform.origin = menu_pos
		look_at(cam_pos, Vector3.UP)
		self.scale = Vector3(-1, 1, 1)
		self.visible = true
		
	else :
		get_tree().paused = false
		inmenu = false
		self.visible = false
