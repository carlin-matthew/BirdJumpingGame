extends Node

var highscore: int = 0
var filepath := "user://BirdGameHighscore.save"

func save(score):
	highscore = score
	#var file := FileAccess.open(filepath, FileAccess.WRITE)
	#file.store_32(highscore)
	#file.close()

func load() -> int:
	#if FileAccess.file_exists(filepath):
		#var file := FileAccess.open(filepath,FileAccess.READ)
		#highscore = file.get_32()
		#file.close()
	return highscore
