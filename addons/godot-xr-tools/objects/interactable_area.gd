@tool
class_name XRToolsInteractableArea
extends Area3D

# nom qui s'affichera sur le Label3D
@export var action_name: String = "Interact"


func _ready() -> void:
	monitoring = true
	add_to_group("interaction_areas")
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited",  Callable(self, "_on_body_exited"))


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player_body"):
		print("Player Entered ", get_parent().name)
		call_deferred("_register_area")


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("player_body"):
		print("Player Exited ", get_parent().name)
		call_deferred("_unregister_area")
		
		if InteractionManager.can_interact == false :
			if get_parent().has_method("exit_interaction") :
				call_deferred("_exit_interaction")
		else :
			InteractionManager.can_interact = true

func _register_area() -> void:
	InteractionManager.register_area(self)

func _unregister_area() -> void:
	InteractionManager.unregister_area(self)

func _exit_interaction() -> void:
	get_parent().exit_interaction()

func check_interaction() -> bool :
	print("Area : Check_interaction")
	print(get_parent().name)
	return get_parent().check_interaction()
