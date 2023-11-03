extends Control

@onready var progress : ProgressBar = $ProgressBar

func update_experience_bar(value):
	progress.value = value

func update_total_experience_bar(value):
	progress.max_value = value
