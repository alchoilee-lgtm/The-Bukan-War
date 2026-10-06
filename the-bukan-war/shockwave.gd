extends Area2D

func _ready() -> void:
	rotation_degrees = randi_range(0, 360)

func _process(delta: float) -> void:
	position += transform.x * 15

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
