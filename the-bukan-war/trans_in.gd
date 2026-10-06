extends Sprite2D

func _ready() -> void:
	position = Vector2(592, 966)

func _process(delta: float) -> void:
	for i in 20:
		position.y = lerp(position.y, 315.0 , 0.05)
		await get_tree().create_timer(0.05).timeout
	queue_free()
