extends Control
var inside = preload("res://trans_in.tscn")

func _on_start_button_pressed() -> void:
	var scene7 = inside.instantiate()
	get_parent().add_child(scene7)
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://story.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
