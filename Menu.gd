extends Control



var playmusic = true
func _ready():
	pass

func _process(delta):
	pass




func _on_exit_pressed():
	get_tree().quit()


func _on_button_pressed():
	$Panel.visible = false
	


func _on_guide_pressed():
	$Panel.visible = true


func _on_start_pressed():
	HungerManager.new_game()
	get_tree().change_scene_to_file("res://library.tscn")


func _on_mute_pressed():
	var musicPosition = $AudioStreamPlayer.get_playback_position()
	if playmusic :
		$AudioStreamPlayer.stream_paused = true
		$mute.texture_normal = load("res://Menu/mute.png")
		$mute.texture_pressed = load("res://Menu/mute.png")
		$mute.texture_focused = load("res://Menu/mute.png")

		playmusic = false
	else:
		$AudioStreamPlayer.play(musicPosition)
		$mute.texture_normal = load("res://Menu/playing.png")		
		$mute.texture_pressed = load("res://Menu/playing.png")		
		$mute.texture_focused = load("res://Menu/playing.png")		

		playmusic = true
	
