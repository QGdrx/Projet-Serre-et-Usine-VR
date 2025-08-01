extends Node3D

func interact() -> void:
	print("on_Interact de TestScreen lancé : Interaction sur l’objet TestScreen !")
	# ici vous pouvez afficher votre UI, lancer une animation, etc.
	
func exit_interaction() -> void:
	InteractionManager.check_interactions()

# Fonction qui check si l'interaction avec l'objet est toujours en cours et renvoie true si oui
func check_interaction() -> bool :
	return false
