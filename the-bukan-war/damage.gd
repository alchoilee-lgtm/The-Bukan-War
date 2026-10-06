extends Sprite2D

func _ready():
	modulate.a = 0
	for i in range(10):
		modulate.a += 0.1
		await get_tree().create_timer(0.01).timeout
	for i in range(10):
		modulate.a -= 0.1
		await get_tree().create_timer(0.01).timeout
	queue_free()
