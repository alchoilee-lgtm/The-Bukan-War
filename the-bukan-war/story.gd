extends Node2D
var f1 = preload("res://Frame_1.tscn")
var f2 = preload("res://frame_2.tscn")
var f3 = preload("res://frame_3.tscn")
var f4 = preload("res://frame_4.tscn")
var f5 = preload("res://frame_5.tscn")
var f6 = preload("res://frame_6.tscn")
var outside = preload("res://trans_out.tscn")
var inside = preload("res://trans_in.tscn")

func _ready():
	var scene7 = outside.instantiate()
	get_parent().add_child(scene7)
	var scene1 = f1.instantiate()
	add_child(scene1)
	var scene2 = f2.instantiate()
	add_child(scene2)
	var scene3 = f3.instantiate()
	add_child(scene3)
	var scene4 = f4.instantiate()
	add_child(scene4)
	var scene5 = f5.instantiate()
	add_child(scene5)
	var scene6 = f6.instantiate()
	add_child(scene6)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var scene8 = inside.instantiate()
		get_parent().add_child(scene8)
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://game.tscn")



func _on_timer_timeout() -> void:
	var scene8 = inside.instantiate()
	get_parent().add_child(scene8)
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://game.tscn")
