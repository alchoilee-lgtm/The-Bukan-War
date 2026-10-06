extends Area2D
var scaling = true
var fire = preload("res://fire.tscn")

var targetpos = Vector2(randi_range(200, 900), randi_range(100, 500))

func _process(delta: float) -> void:
	position = position.lerp(targetpos, 0.9999 * delta)
	if position > targetpos - Vector2(100, 100) and round(position) < targetpos + Vector2(100, 100):
		for i in range(8):
			rotate(0.785)
			var scene = fire.instantiate()
			get_parent().add_child(scene)
			scene.rotation = global_rotation
			scene.position = position
		queue_free()
	
