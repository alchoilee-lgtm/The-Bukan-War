extends CharacterBody2D
var bullet = preload("res://bullet.tscn")
var damage = preload(("res://damage.tscn"))
const max_speed = 400
const accel = 1500
const friction = 300
@onready var screen_size = get_viewport_rect().size
var input = Vector2.ZERO
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
var dead = false

func _ready():
	Global.health = 150
	Global.energy = 10
func _physics_process(delta: float) -> void:
	player_movement(delta)
	position = position.clamp(Vector2.ZERO, screen_size)

func get_input():
	input.x = int(Input.is_action_pressed("d")) - int(Input.is_action_pressed("a"))
	input.y = int(Input.is_action_pressed("s")) - int(Input.is_action_pressed("w"))
	return input.normalized()

func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)
	
	move_and_slide()

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	$HealthBar.value = Global.health
	$EnergyBar.value = Global.energy
	if Global.energy > 0 and Input.is_action_just_pressed("click"):
		var scene = bullet.instantiate()
		get_parent().add_child(scene)
		scene.rotation = global_rotation
		scene.position = global_position
		Global.energy -= 1
		audio_stream_player.play()
	$HealthBar.position = global_position + Vector2 (-60, -70)
	if input == Vector2.ZERO:
		position.x -= 1
	Global.player_pos = position
	if Input.is_action_just_pressed("ui_accept") and dead:
		get_tree().reload_current_scene()
	if Global.health > 150:
		Global.health = 150

func _on_area_2d_area_entered(area: Area2D) -> void:
	Global.health -= 10
	Global.screen_shake = 1
	var scene2 = damage.instantiate()
	get_parent().add_child(scene2)
	if Global.health < 10:
		$DedScreeen.visible = true
		dead = true
