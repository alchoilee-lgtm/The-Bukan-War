extends Node2D

var shockwave = preload("res://shockwave.tscn")


func _process(delta: float) -> void:
	rotation = randf_range(4.0, 4.3)
	for i in range(8):
		rotate(-0.2)
		var scene = shockwave.instantiate()
		get_parent().add_child(scene)
		scene.rotation = rotation
		scene.position = position
	queue_free()
