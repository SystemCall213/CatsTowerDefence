extends ProgressBar
class_name HPBar

@onready var label: RichTextLabel = $text

func set_text(_text: String):
	label.text = _text
