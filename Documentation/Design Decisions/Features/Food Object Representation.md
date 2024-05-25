
# Decision:
How should a food object be represented within the game?

---
# Github Issue: [#16](https://github.com/JackFawthorpe/FoodRTS/issues/16) 
---
# Related Documents
[[Food]]

---
# Notes

FoodData:
- Current Implementation is read-only but it should probably be modifiable per entity
FoodPile:
- Can piles be merged? - Does Quality belong to a single piece of food or a group?
Initial design will keep it simple with a single FoodData to represent the grouping, alongside the quantity
SellOrder:
- Represents an option that will be sold in the market. [[Market Screen - 1]] needs to be build UI based on these sell orders.
Supplier:
- Doesn't need to know about the 3d Model

Model Coupling:
- The model is directly tied to the food at the moment, Is there a scenario where the model would be used without the Food??

---
# Diagram

![[Food Representation Diagram]]
---
# References
[Entity Component Pattern](https://www.gdquest.com/tutorial/godot/design-patterns/entity-component-pattern/)