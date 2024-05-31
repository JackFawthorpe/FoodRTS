
# Decision:
What is an appropriate design to create a dynamic room designer

---
# Github Issue: [#34](https://github.com/JackFawthorpe/FoodRTS/issues/34) 
---
# Related Documents
[[Prototype Factory Building]]
[[Drawings/Tech Designs/Factory Layout Designer|Factory Layout Designer]]

---
# Diagram
![[Drawings/Tech Designs/Factory Layout Designer]]
---
# Comments on AC's

- AC1: FactoryGenerator is where the user defines the sizes, it then calls on the Room API to generate the walls and floor
- AC2 + 3: DefaultTiles can be handled by FactoryStylers having reference to a default tile that points to a default_tile texture. Changing the texture in file explorer effectively changes all the defaults
- AC4+5: Doable with specifying a room with hidden walls and composing a room of room components
- AC6: Simply Import the FactoryLayout Component
- AC7: Achieved with the static2D node
- AC8: Doable with the use of hide wall
---
# Other Notes
In future, there may be a need to combine rooms into a shared entity? As shown in the diagram, describing a room as 3 different rooms is unintuitive


---
# References