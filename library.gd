extends Node2D




func _ready():
	print(HungerManager.get_hunger())
	print(HungerManager.get_cloths())
	if HungerManager.get_cloths() == 'blue':
		$CharacterBody2D/AnimatedSprite2D.play("default")
	else:
		$CharacterBody2D/AnimatedSprite2D.play("new_style_default")
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
		

	if $CharacterBody2D.position.x > 420 and $CharacterBody2D.position.x < 600 and HungerManager.get_cloths() != 'green':
					$StaticBody2D2/Bg/alamatTaajob2.visible = true
					if Input.is_action_just_pressed("ui_accept"):
						get_tree().change_scene_to_file("res://cloths_shop.tscn")
	else:
		$StaticBody2D2/Bg/alamatTaajob2.visible = false
		

