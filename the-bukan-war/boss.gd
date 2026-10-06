extends CharacterBody2D
var bullet = preload("res://boss bullet.tscn")
var bomb = preload("res://boss_bomb.tscn")
var shockwave = preload("res://shockwave_gen.tscn")
var letter_cloner = preload("res://letter_cloner.tscn")
var bullet_pos_fa
var health
var y_position
@onready var screen_size = get_viewport_rect().size
@onready var explosion: AudioStreamPlayer = $explosion



func _ready() -> void:
	health = 1500
	Global.bullet_phase = 1
	Global.letter_cloner_done  = 0
	print(position)









func _process(delta: float) -> void:
	if health < 0:
		get_tree().change_scene_to_file("res://win_screen.tscn")
	$ProgressBar.value = health
	$ProgressBar.position = Vector2(300,50)
	y_position = position.y


func _on_area_2d_area_entered(area: Area2D) -> void:
	health -= 20
	Global.screen_shake = 1
	explosion.play()


func _on_first_attack_timeout() -> void:
	if Global.bullet_phase == 5:
		if Global.letter_cloner_done == 1:
			return
		Global.bullet_phase = 100
		Global.letter_cloner_done = 1
		var scene4 = letter_cloner.instantiate()
		get_parent().add_child(scene4)
		print_stack()
		for forever in 1000000:
			if Global.letter_cloner_done == 0:
				Global.bullet_phase = 1
				return
			await get_tree().create_timer(0.01).timeout
	
	
	if Global.bullet_phase == 4:
		Global.bullet_phase = 100
		for frames in 157:
			rotate(0.01)
			await get_tree().create_timer(0.005).timeout
		for number_of_attacks in 5:
			position.x = 1091.0
			for frames in 200:
				position.y = lerp(y_position, Global.player_pos.y, 0.1)
				await get_tree().create_timer(0.01).timeout
			
			for frames in 15:
				position.x += 4
				await get_tree().create_timer(0.01).timeout
			
			
			for frames in 30:
				position.x -= 40
				position = position.posmodv(screen_size)
				await get_tree().create_timer(0.01).timeout
			
		position = Vector2(1091.0, 315.0)
		for frames in 157:
			rotate(-0.01)
			await get_tree().create_timer(0.005).timeout
			Global.bullet_phase = 5
		return
	
	if Global.bullet_phase == 3:
		Global.bullet_phase = 100
		for i in range(4):
			var scene3 = shockwave.instantiate()
			get_parent().add_child(scene3)
			scene3.position = Vector2(1090, 325)
			await get_tree().create_timer(2.5).timeout
		Global.bullet_phase = 4
	
	if Global.bullet_phase == 2:
		Global.bullet_phase = 100
		for i in range (6):
			var scene2 = bomb.instantiate()
			get_parent().add_child(scene2)
			scene2.position = Vector2(1090, randi_range(50, 550))
			await get_tree().create_timer(1.5).timeout
		Global.bullet_phase = 3
	
	
	if Global.bullet_phase == 1:
		Global.bullet_phase = 100
		for i in range(10):
			bullet_pos_fa = Vector2(1045, Global.player_pos.y)
			for r in range(5):
				var scene = bullet.instantiate()
				get_parent().add_child(scene)
				scene.position = bullet_pos_fa - Vector2(0, randi_range(-100, 100))
				await get_tree().create_timer(0.2).timeout
				
		Global.bullet_phase = 2
