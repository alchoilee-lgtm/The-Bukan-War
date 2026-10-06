extends Area2D

var particle = preload("res://bulletparticles.tscn")

func _process(delta: float) -> void:
	position += transform.x * 15
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	var scene = particle.instantiate()
	get_parent().add_child(scene)
	scene.position = global_position
	queue_free()
	
