extends Node2D

const AI_OPTIONS = ["ROCK", "PAPER", "SCISSOR"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func select_round_winner(player_selected):
	var probabilities = [1, 1, 1];
	var random = RandomNumberGenerator.new()
	var ai_selected = AI_OPTIONS[random.rand_weighted(probabilities)]
	
	print("Player: ", player_selected, " AI: ", ai_selected)
	print("-----------------------------------")
	
	if ai_selected == player_selected:
		print("DRAW")
	elif ai_selected == "ROCK":
		if player_selected == "PAPER":
			print("PLAYER WON")
		else:
			print("COMPUTER WON")
	elif ai_selected == "PAPER":
		if player_selected == "SCISSOR":
			print("PLAYER WON")
		else:
			print("COMPUTER WON")
	else:
		if player_selected == "ROCK":
			print("PLAYER WON")
		else:
			print("COMPUTER WON")
	
func select_game_winner():
	pass


func _on_exit_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_restart_btn_pressed() -> void:
	get_tree().reload_current_scene()


func _on_rock_pressed() -> void:
	select_round_winner("ROCK")


func _on_paper_pressed() -> void:
	select_round_winner("PAPER")


func _on_scissor_pressed() -> void:
	select_round_winner("SCISSOR")
