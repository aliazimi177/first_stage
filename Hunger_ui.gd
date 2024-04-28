extends Label


func _ready():
	hunger_init()
	
func hunger_init():
	visible = true
	text = HungerManager.get_hunger()
