extends Node2D




func _ready():
	print(HungerManager.get_hunger())


func _process(_delta):


	if ($CharacterBody2D.position.x < -575 or $CharacterBody2D.position.x > 860):
		$CharacterBody2D/AnimatedSprite2D.play("default")

	
	
	if($CharacterBody2D.position.x > 618 and $CharacterBody2D.position.x < 860) and HungerManager.get_hunger() == 'Hungry':
			$StaticBody2D2/Bg/alamatTaajob.visible = true
			if Input.is_action_just_pressed("ui_accept"):
				#HungerManager.insert_hunger('Full!')
				#$CharacterBody2D/HungerUI/hunger_status.hunger_init()
				get_tree().change_scene_to_file("res://pizza_place.tscn")
	else:
			$StaticBody2D2/Bg/alamatTaajob.visible = false
		
		
	
	
	


func _on_button_pressed():
	get_tree().change_scene_to_file("res://fin_bath/fin_bath.tscn")
