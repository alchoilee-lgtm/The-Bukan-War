extends Sprite2D

func _ready() -> void:
	position = Vector2(592, 315)

func _process(delta: float) -> void:
	for i in 10:
		position.y = lerp(position.y, 1000.0 , 0.05)
		print("67")
		await get_tree().create_timer(0.05).timeout
