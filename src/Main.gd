extends Node2D

var DIR = OS.get_executable_path().get_base_dir()
var interpreter_path = DIR.plus_file("venv/bin/python3.10")
var script_path = DIR.plus_file("scripts/talk.py")

var dialogues = [
	"This is the first line of dialogue.",
	"This is the second line of dialogue.",
	"This is the third line of dialogue."
]
var dialogue_index = 0

onready var dialogue_label = $CanvasLayer/Dialogue

func _ready():
	if !OS.has_feature("standalone"): # if NOT exported version
		interpreter_path = ProjectSettings.globalize_path("res://venv/bin/python3.10")
		script_path = ProjectSettings.globalize_path("res://scripts/talk.py")

	display_dialogue()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		dialogue_index += 1
		display_dialogue()

func display_dialogue():
	if dialogue_index < dialogues.size():
		dialogue_label.text = dialogues[dialogue_index]
	else:
		talk()

func talk():
	print("Start talk()")
	var output = []
	var exit_code = OS.execute(interpreter_path, [script_path], true, output)
	if exit_code == 0:
		print("Python talk script output: ", output)
		dialogues = output
		dialogue_index = 0
		display_dialogue()
	else:
		print("Python talk script error. Exit code: ", exit_code)
