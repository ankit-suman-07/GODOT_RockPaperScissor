extends Node2D

@onready var round_selections = $RoundSelections
@onready var player_score = $PlayerScoreValue
@onready var computer_score = $ComputerScoreValue 
@onready var computer_btn = $CenterContainer/HBoxContainer/VBoxContainer2/AI
@onready var round_result = $WinnerLabel
@onready var winner_label = $RoundResult

const ROCK = "ROCK"
const PAPER = "PAPER"
const SCISSOR = "SCISSOR"

const AI_OPTIONS = [ROCK, PAPER, SCISSOR]

var round = 5
var player_score_value = 0
var computer_score_value = 0

var rng = RandomNumberGenerator.new()


func _ready() -> void:
	rng.randomize()


func select_round_winner(player_selected):
	var ai_selected = AI_OPTIONS[rng.randi_range(0, AI_OPTIONS.size() - 1)]
	
	computer_btn.text = ai_selected
	round_selections.text = player_selected + " vs " + ai_selected
	
	var result = get_result(player_selected, ai_selected)
	
	match result:
		"DRAW":
			round_result.text = "DRAW"
		"PLAYER":
			round_result.text = "PLAYER WON"
			player_score_value += 1
		"AI":
			round_result.text = "COMPUTER WON"
			computer_score_value += 1
	
	update_scores()
	select_game_winner()


func get_result(player, ai):
	if player == ai:
		return "DRAW"
	
	match player:
		ROCK:
			return "PLAYER" if ai == SCISSOR else "AI"
		PAPER:
			return "PLAYER" if ai == ROCK else "AI"
		SCISSOR:
			return "PLAYER" if ai == PAPER else "AI"
	
	return "ERROR"


func update_scores():
	player_score.text = str(player_score_value)
	computer_score.text = str(computer_score_value)


func select_game_winner():
	if round > 1:
		round -= 1
		return
	
	if player_score_value == computer_score_value:
		winner_label.text = "DRAW"
	elif player_score_value > computer_score_value:
		winner_label.text = "PLAYER WON"
	else:
		winner_label.text = "COMPUTER WON"
	
	disable_all_buttons()


func disable_all_buttons():
	var container = $CenterContainer/HBoxContainer/VBoxContainer
	
	for child in container.get_children():
		if child is Button:
			child.disabled = true


func _on_exit_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_restart_btn_pressed() -> void:
	get_tree().reload_current_scene()


func _on_rock_pressed() -> void:
	select_round_winner(ROCK)


func _on_paper_pressed() -> void:
	select_round_winner(PAPER)


func _on_scissor_pressed() -> void:
	select_round_winner(SCISSOR)
