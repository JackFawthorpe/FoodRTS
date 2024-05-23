# Decision:

What is the best choice for perspective in the game?

---
# Github Issue: [#2](https://github.com/JackFawthorpe/FoodRTS/issues/2)
---
# Related Documents:

[[Game Engine]]
[[Game Definition]]

---
# Tags

---
# Options

- First Person
- Third Person
- Top Down View
- RPG View (Between 90 and 180 degrees)
- Isometric View
- Side View
---
# Requirements

- The camera perspective should allow for quick inspection of large areas
	- [[Game Definition]] : Controlling Workers
	- [[Game Definition]] : Controlling Machines
- Camera isn't attached to an entity, a factory is controlled, not a player
- It should support multiple levels
- It should be easy to interact with overlapping entities

---
# Option Evaluation

| Requirement                           | First Person | Third Person | Top Down | RPG | Isometric | Side View |
| ------------------------------------- | ------------ | ------------ | -------- | --- | --------- | --------- |
| Inspection of Large Areas<br>         | ❌            | ❌            | ✔️       | ✔️  | ✔️        | ❌         |
| No Entity                             | ❌            | ❌            | ✔️       | ✔️  | ✔️        | ❌         |
| Interaction with overlapping Entities | ❌            | ❌            | ✔️       | ✔️  | ✔️        | ❌         |

Isometric, Top Down and RPG can all be categorized as floating cameras. The difference between them is the angle that is applied on the camera against the floor.

Experimentation will be required to differentiate between these to determine what best fits the use case


---
# References
[Popular Camera Angles In Video Games](https://behind-the-scenes.net/popular-camera-angles-used-in-video-games/#First-person_view)