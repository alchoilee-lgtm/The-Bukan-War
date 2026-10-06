extends Area2D


func _ready():
	rotation = 3.14
func _process(delta: float) -> void:
	position += transform.x * 15


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
