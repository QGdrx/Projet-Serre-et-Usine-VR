extends XRController3D

func _ready() -> void :
	connect ("button_pressed", Button_function)
	
func Button_function(button_name : String) -> void :
	#print(button_name)
	if button_name == "ax_button" :
		InteractionManager.try_interact()
	if button_name == "by_button" and InteractionManager.can_interact == false :
		InteractionManager.reinteract()
