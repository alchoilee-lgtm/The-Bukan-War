extends Camera2D

@export var random_strength: float = 15
@export var shake_fade: float = 5.0

var rng = RandomNumberGenerator.new()

var shake_strength: float = 0.0

func apply_strength():
	shake_strength = random_strength

func random_offset():
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))
	
func _process(delta):
	if Global.screen_shake == 1:
		apply_strength()
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shake_fade * delta)
	offset = random_offset()
	Global.screen_shake = 0
