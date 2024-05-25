
# Decision:
What is the most appropriate way to design a UI interface in Godot

---
# Github Issue: [#6](https://github.com/JackFawthorpe/FoodRTS/issues/6) 
---
# Related Documents
[[Buy an Item]]
[[Market Screen]]

---
# Options

Identify what design patterns are used to solve each of the problems outlined in the requirements

---
# Requirements

1. How can we blur / darken the background whilst in menus 
Blurring in menus is a form of a [Screen Reading Shader](https://docs.godotengine.org/en/3.0/tutorials/shading/screen-reading_shaders.html) . Reference to Godots implementation of shaders can be found [here](https://docs.godotengine.org/en/3.0/tutorials/shading/index.html) . Here is an [example implementation](https://github.com/godotengine/godot-demo-projects/blob/3.5-9e68af3/2d/screen_space_shaders/shaders/blur.shader) . It would just need to be applied against the cameras capture

2. How can we create templated components for consistency
A suggestion would be to create a set of scenes with the default components in them and then load them into the scene. Each scene can then be loaded in as a Node (Chain button at the top of scene browser).

3. How can we template UI components such as cards against an object within the game
Parameterization is done by adding a script to the root node of the scene and then using the ```_ready``` function to control its children.

ChatGPT example shown below

```
# Scene Root Script:

export (String) var title = ""
func _ready():
	$TitleLabel.text = title

# Instantiation

var menu = preload(ResourceURL).instance()
menu.title = "Injected Title"
add_child(menu)
```
---
# References
[Godot User Interface Tutorial ](https://www.youtube.com/watch?v=w0abIGbJntQ)  