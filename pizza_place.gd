extends Control






func _ready():
	print(HungerManager.get_hunger())


func _process(delta):
	$Chef/AnimatedSprite2D.play("talking")


func _on_yes_pizza_pressed():
	HungerManager.insert_hunger('Full!')
	#$Timer.wait_time = 5
	#$Timer.start()
	$eating.play()
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://library.tscn")

func _on_no_pizza_pressed():
	get_tree().change_scene_to_file("res://library.tscn")


func TimeTimeout():
	print("Timer finished!")
