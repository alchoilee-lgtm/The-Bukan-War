extends Node2D
var drunkbean = preload("res://drunk bean.tscn")
var outside = preload("res://trans_out.tscn")
var wait = 0

func _ready() -> void:
	var scene2 = outside.instantiate()
	get_parent().add_child(scene2)

func _process(delta: float) -> void:
	if Global.energy > 10:
		Global.energy = 10



func _on_bean_spawn_timeout() -> void:
	if Global.clonenum < 3:
		var scene = drunkbean.instantiate()
		get_parent().add_child(scene)
		scene.position = Vector2(1075, randi_range(100, 600))
		Global.clonenum += 1


func _on_energy_timeout() -> void:
	Global.energy += 1
