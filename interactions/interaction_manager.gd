extends Node3D

@onready var player
@onready var label : Label3D = $Label3D
@onready var camera : Camera3D
var copea_seed : bool
var scenario1 : bool

const base_text : String = "[A] to "

var active_areas : Array = []
var can_interact : bool = true

## Functions
func _ready() -> void:
	Engine.get_main_loop().connect("node_added", Callable(self, "_on_node_added"))
	# si on enlève cette ligne le tou crashera, cette ligne maintien la réalité en cohérence idk why
	refresh()

func _on_node_added(node: Node) -> void:
	if node.is_in_group("player_body") or node is Camera3D:
		refresh()
		#pass

func refresh():
	camera = get_viewport().get_camera_3d()
	player = get_tree().get_first_node_in_group("player_body")


func register_area(area : XRToolsInteractableArea) :
	if not active_areas.has(area) :
		active_areas.append(area)


func unregister_area(area : XRToolsInteractableArea) :
	active_areas.erase(area)


func _sort_by_distance_to_player(a : XRToolsInteractableArea, b : XRToolsInteractableArea) :
	return player.global_position.distance_to(a.global_position) < player.global_position.distance_to(b.global_position)


func _process(_delta):
	if active_areas.size() > 0 && can_interact :
		active_areas.sort_custom(_sort_by_distance_to_player)
		var area = active_areas[0]
		
		if area.get_parent().has_method("change_action_name") :
			area.get_parent().change_action_name(area)
		
		label.text = base_text + area.action_name
		
		var obj_pos = area.global_transform.origin
		var cam_pos = camera.global_transform.origin
		var dir3d = (cam_pos - obj_pos).normalized()
		#  Distance du texte à l'objet
		var orbit_radius : float = 0.8
		var min_cam_distance : float = 0.8
		

		var label_pos = obj_pos + dir3d * orbit_radius
		var distance_to_cam = label_pos.distance_to(cam_pos)
		
		if distance_to_cam < min_cam_distance:
			var correction_dir = (label_pos - cam_pos).normalized()
			label_pos = cam_pos + correction_dir * min_cam_distance
			
		label.look_at_from_position(label_pos, cam_pos, Vector3.UP)
		label.scale = Vector3(-1, 1, 1)
		label.show()
	else : 
		label.hide()


func try_interact() -> void :
	if not can_interact or active_areas.is_empty():
		print("try_interact : Cannot Interact")
		return
	
	# Récupère la zone la plus proche
	var area = active_areas[0]
	var target = area.get_parent()
	if target and target.has_method("interact"):
		# On met ce flag en false le temps de finir ce que l'interaction avec l'objet fait
		# on le remettra en "on" à la fin de l'interaction
		can_interact = false
		label.hide()
		target.interact()
	else :
		print("No interact() method in Object")


func reinteract() -> void :
	var area = active_areas[0]
	var target = area.get_parent()
	if target and target.has_method("exit_interaction"):
		target.exit_interaction()


func check_interactions() -> void : 
	print(active_areas)
	
	for a in active_areas :
		if a.check_interaction() == true :
			print("There is still an interaction, function returns")
			return
	print("No interaction, can interact anew")
	can_interact = true


func open_button_screen() -> void :
	var screen = get_tree().get_nodes_in_group("Button_Screen")
	if screen[0] and screen[0].has_method("activated") :
		screen[0].activated()
