extends CharacterBody2D
var particle = preload("res://drunkbeanparticles.tscn")
@onready var screen_size = get_viewport_rect().size


func _process(delta: float) -> void:
	_move(delta)


func _move(delta):
	var target_pos =  Vector2(randi_range(-100, 100), randi_range(-100, 100))
	for index in randi_range(100, 200):
		velocity = target_pos / 4
		move_and_slide()
		position = position.posmodv(screen_size)
		await get_tree().physics_frame


func _on_area_2d_area_entered(area: Area2D) -> void:
	Global.energy += 3
	if Global.energy > 10:
		Global.health += 10
	var scene = particle.instantiate()
	get_parent().add_child(scene)
	scene.position = global_position
	Global.clonenum -= 1
	queue_free()
