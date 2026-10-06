extends Node2D

func _ready() -> void:
	position = Vector2(1030, 110)

func _process(delta: float) -> void:




while position.y < 500:
		position.y += 2 * delta
		get_tree().create_timer(0.1).timeout
