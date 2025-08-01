extends Node3D

var tree


func change_action_name(area : XRToolsInteractableArea) -> void :
	tree = get_tree()
	var tree_name = tree.get_current_scene().name
	if tree_name == "Spawn" :
		if self.name == "ChangeSceneUsine" :
			area.action_name = "go to the Factory"
		else :
			area.action_name = "go to the Greenhouse"
	if tree_name == "Usine" or tree_name == "Serre" :
		area.action_name = "go to the Lobby"


func interact() -> void:
	var packed: PackedScene
	tree = get_tree()
	
	if self.name == "ChangeSceneUsine" :
		if tree.get_current_scene().name == "Spawn":
			packed = load("res://World/map_Usine.tscn")
			print("Player Exited ", get_tree().get_current_scene().name)
		elif tree.get_current_scene().name == "Usine":
			packed = load("res://World/map_Spawn.tscn")
			print("Player Exited ", get_tree().get_current_scene().name)
			
	elif self.name == "ChangeSceneSerre" :
		if tree.get_current_scene().name == "Spawn":
			packed = load("res://World/map_Serre.tscn")
			print("Player Exited ", get_tree().get_current_scene().name)
		elif tree.get_current_scene().name == "Serre":
			packed = load("res://World/map_Spawn.tscn")
			print("Player Exited ", get_tree().get_current_scene().name)
			
	tree.change_scene_to_packed(packed)
	InteractionManager.active_areas.clear()


func exit_interaction() -> void:
	InteractionManager.check_interactions()

# Fonction qui check si l'interaction avec l'objet est toujours en cours et renvoie true si oui
func check_interaction() -> bool :
	return false
