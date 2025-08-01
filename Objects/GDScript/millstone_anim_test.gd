extends Node3D

@onready var area : XRToolsInteractableArea = $XRToolsInteractableArea
@onready var anim : AnimationPlayer = $AnimationPlayer
var player_close_machine : bool = false
var player_open_machine : bool = false


func interact() -> void:
	if anim.is_playing() : 
		player_open_machine = true
		return
	anim.play("Ouverture")

# Check si on est toujours dans la HitBox, si non l'écran disparait
func exit_interaction() -> void:
	InteractionManager.check_interactions()
	if anim.is_playing() : 
		player_close_machine = true
		return
	# a fix, ça joue l'anim de fermeture en boucle si on est dans une autre zone d'interaction
	anim.play("Fermeture")
	
	#if self.name == InteractionManager.active_areas[0].name or InteractionManager.active_areas[0].name == null :
	#	if anim.is_playing() : 
	#		player_close_machine = true
	#		return
	#	anim.play("Fermeture")


# Fonction qui check si l'interaction avec l'objet est toujours en cours et renvoie true si oui
func check_interaction() -> bool :
	return false

# Buffer histoire de ne pas avoir de changement soudain à un autre animation
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if player_close_machine == true and player_open_machine == true :
		if anim_name == "Fermeture" :
			player_open_machine = false
			anim.play("Ouverture")
		else :
			player_close_machine = false
			anim.play("Fermeture")
	elif player_close_machine == true :
		player_close_machine = false
		anim.play("Fermeture")
	elif player_open_machine == true :
		player_open_machine = false
		anim.play("Ouverture")
