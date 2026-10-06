extends Node2D
var first_chunk
var second_chunk
var third_chunk
var fourth_chunk
var fifth_chunk
var chunks = []
var code_first_number_string
var code_first_number
var code_for_shoot
var current_letter 
var letter = preload("res://letter.tscn")
var sayings = [
	"bukus suck",
	"beans rule",
	"try harder",
	"too easy",
	"at least try",
	"you wont win",
	"bts is king",
]

var shoot_code = {
	" " = "0000000000000000000000000",
	"a" = "0111110100101001010001111",
	"b" = "1111110101101011010101010",
	"c" = "0111010001100011000110001",
	"d" = "1111110001100011000101110",
	"e" = "1111110101101011010110001",
	"f" = "1111110100101001010010000",
	"g" = "0111010001101011010101101",
	"h" = "1111100100001000010011111",
	"i" = "1000110001111111000110001",
	"j" = "0001000001100011111000000",
	"k" = "1111100100010100100110001",
	"l" = "1111100001000010000100001",
	"m" = "1111101000001000100011111",
	"n" = "1111101000001000001011111",
	"o" = "0111010001100011000101110",
	"p" = "1111110100101001010001100",
	"q" = "0111010001100111010001111",
	"r" = "1111110100101001101000001",
	"s" = "0100110101101011010100110",
	"t" = "1000010000111111000010000",
	"u" = "1111000001000010000111110",
	"v" = "1110000010000010001011100",
	"w" = "1111100001001100000111110",
	"x" = "1000101010001000101010001",
	"y" = "1100000100001110010011000",
	"z" = "1000110011101011100110001",
}

func split_word_into_chunks():
	chunks.clear()
	for item in RegEx.create_from_string(".{1,5}").search_all(code_for_shoot):
		chunks.append(item.get_string())
	first_chunk = chunks[0]
	second_chunk = chunks[1]
	third_chunk = chunks[2]
	fourth_chunk = chunks[3]
	fifth_chunk = chunks[4]

func code_to_shoot(string, posy_y):
	var word = string
	for i in range(word.length()):
		current_letter = word[i]
		code_for_shoot = shoot_code[current_letter]
		split_word_into_chunks()
		for shoot_num in range(5):
			position.y = posy_y
			
			if shoot_num == 0:
				for index in range(5):
					position.y += 20
					code_first_number_string = str(first_chunk)
					code_first_number = int(code_first_number_string[index])
					if code_first_number == 1:
						var scene = letter.instantiate()
						get_parent().add_child(scene)
						scene.position = position
			
			if shoot_num == 1:
				for index in range(5):
					position.y += 20
					code_first_number_string = str(second_chunk)
					code_first_number = int(code_first_number_string[index])
					if code_first_number == 1:
						var scene = letter.instantiate()
						get_parent().add_child(scene)
						scene.position = position
			
			if shoot_num == 2:
				for index in range(5):
					position.y += 20
					code_first_number_string = str(third_chunk)
					code_first_number = int(code_first_number_string[index])
					if code_first_number == 1:
						var scene = letter.instantiate()
						get_parent().add_child(scene)
						scene.position = position
			
			if shoot_num == 3:
				for index in range(5):
					position.y += 20
					code_first_number_string = str(fourth_chunk)
					code_first_number = int(code_first_number_string[index])
					if code_first_number == 1:
						var scene = letter.instantiate()
						get_parent().add_child(scene)
						scene.position = position
			
			if shoot_num == 4:
				for index in range(5):
					position.y += 20
					code_first_number_string = str(fifth_chunk)
					code_first_number = int(code_first_number_string[index])
					if code_first_number == 1:
						var scene = letter.instantiate()
						get_parent().add_child(scene)
						scene.position = position
			
			await get_tree().create_timer(0.02).timeout
		await get_tree().create_timer(0.04).timeout


func _on_first_attack_timeout() -> void:
	position = Vector2(1000,150)
	var random_word = sayings.pick_random()
	code_to_shoot(random_word,50)


func _on_second_attack_timeout() -> void:
	position = Vector2(1000,400)
	var random_word = sayings.pick_random()
	code_to_shoot(random_word, 400)


func _on_third_attack_timeout() -> void:
	position = Vector2(1000,275)
	var random_word = sayings.pick_random()
	code_to_shoot(random_word, 200)
	print("im done")
	Global.letter_cloner_done = 0
