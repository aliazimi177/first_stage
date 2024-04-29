extends Node

var db = SQLite.new()
var db_name = "res://database"
	
func connect_to_db() -> SQLite:
	db.path = db_name
	db.open_db()
	return db
	
func create_settings(db):
	var dict : Dictionary = {}
	var table_name := "settings"
		
	dict["name"] = {
		"data_type":"string", 
		}
		
	dict["value"] = {
		"data_type":"string", 
	}
		
	db.create_table(table_name, dict)

func create_cloths(db):
	var dict : Dictionary = {}
	var table_name := "cloths"
		
	dict["name"] = {
		"data_type":"string", 
		}
		
	dict["value"] = {
		"data_type":"string", 
	}
		
	db.create_table(table_name, dict)
	
func new_game():
	connect_to_db()
	create_settings(db)
	create_cloths(db)
	data_seeding()
	
func data_seeding():
	db.insert_row("settings", {"name": "is_hungry", "value": "Hungry"})
	db.insert_row('cloths',{'name':'cloths','value':'blue'})

func get_cloths():
	var res = db.select_rows('cloths','',['value'])
	res.reverse()
	return res.front()["value"]
	
func insert_cloths(value):
	db.insert_row('cloths',{"name": "cloths", "value": value})
	

func get_hunger():
	var res = db.select_rows("settings", "", ["value"])
	res.reverse()
	return res.front()["value"]
	
func insert_hunger(value):
	db.insert_row("settings", {"name": "is_hungry", "value": value})
