extends Sprite2D


func _on_timer_timeout() -> void:
	$"3".playing = true


func _on_timer_2_timeout() -> void:
	for i in 10:
		modulate.a -= 0.1
		await get_tree().create_timer(0.01).timeout
	queue_free()
