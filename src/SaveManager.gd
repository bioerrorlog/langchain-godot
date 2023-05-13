extends Node

var save_file = ConfigFile.new()

func save_game(key):
	save_file.set_value("config", "api_key", key)
	save_file.save("user://savefile.cfg")

func load_game():
	var error = save_file.load("user://savefile.cfg")
	if error == OK:
		var api_key = save_file.get_value("config", "api_key", "")
		return {"api_key": api_key}
	else:
		return {"api_key": ""}
