extends Area2D
var speed = 30

func _ready():
	z_index = -1

func _process(delta: float) -> void:
	position.x -= speed * delta
	speed = speed * 1.05


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
		queue_free()
