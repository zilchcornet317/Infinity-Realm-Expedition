# This class is used by both player and AI input with different implementations
extends Node
class_name GenericInput

# Direction composited by input set only by this class for others to read, 
# such as states. set on physics updates only.
var direction: Vector2

# set move input on physics process in sub classes
