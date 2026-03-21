extends Node2D

@onready var round_selections = $RoundSelections
@onready var player_score = $PlayerScoreValue
@onready var computer_score = $ComputerScoreValue 
@onready var computer_btn = $CenterContainer/HBoxContainer/VBoxContainer2/AI
@onready var round_result = $"WinnerLabel"
@onready var winner_label = $RoundResult

const AI_OPTIONS = ["ROCK", "PAPER", "SCISSOR", "PAPER", "SCISSOR", "ROCK", "SCISSOR", "ROCK", "PAPER"]
var round = 5
var player_score_value = 0
var computer_score_value = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func select_round_winner(player_selected):
	var probabilities = [1, 1, 1, 1, 1, 1, 1, 1, 1];
	var random = RandomNumberGenerator.new()
	var ai_selected = AI_OPTIONS[random.rand_weighted(probabilities)]
	
	computer_btn.text = ai_selected
	
	round_selections.text = player_selected + "  vs  "   + ai_selected
	
	if ai_selected == player_selected:
		round_result.text = "DRAW"
	elif ai_selected == "ROCK":
		if player_selected == "PAPER":
			round_result.text = "PLAYER WON"
			player_score_value += 1
		else:
			round_result.text = "COMPUTER WON"
			computer_score_value += 1
	elif ai_selected == "PAPER":
		if player_selected == "SCISSOR":
			round_result.text = "PLAYER WON"
			player_score_value += 1
		else:
			round_result.text = "COMPUTER WON"
			computer_score_value += 1
	elif ai_selected == "SCISSOR":
		if player_selected == "ROCK":
			round_result.text = "PLAYER WON"
			player_score_value += 1
		else:
			round_result.text = "COMPUTER WON"
			computer_score_value += 1
	
	player_score.text = str(player_score_value)
	computer_score.text = str(computer_score_value)
	select_game_winner()
	
func select_game_winner():
	if round > 1:
		round -= 1
	else:
		if player_score_value == computer_score_value:
			winner_label.text = "DRAW"
		elif player_score_value > computer_score_value:
			winner_label.text = "PLAYER WON"
		else:
			winner_label.text = "COMPUTER WON"
		
		disable_all_buttons()

func disable_all_buttons():
	# Replace "HBoxContainer/VBoxContainer" with the actual path to your VBox
	var container = $CenterContainer/HBoxContainer/VBoxContainer
	
	for child in container.get_children():
		if child is Button:
			child.disabled = true

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
