# Description
As a user I want to be able to buy Food from the market for use in my factory

---
# Acceptance Criteria

| AC ID | Description                                                                                                                                                         | [[Current State]]               |
| ----- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------ |
| AC1   | Given I am in my factory<br>When I click the "Open Market" button<br>Then the market screen opens                                                                   | `[!!example:UserInterface]`<br> |
| AC2   | Given I am in the Market Screen<br>When I am looking at something to buy<br>Then I am able to see the price of the food<br>And how much is available                | `[!!example:UserInterface]`     |
| AC3   | Given I am on the Market Screen<br>Then I am able to see how much money I have available to spend                                                                   | `[!!example:UserInterface]`     |
| AC4   | Given I am in the Market Screen<br>When I choose a food and a quantity<br>Then I can see how much that quantity will cost                                           | `[!!example:UserInterface]`     |
| AC5   | Given I have selected a food and quantity<br>When I buy the food<br>Then the supply is reduced by that amount                                                       | `[!!example:UserInterface]`     |
| AC6   | Given I have selected an food and Quantity<br>Then I am able to see the remainder before I purchase the product                                                     | `[!!example:UserInterface]`     |
| AC7   | Given I am looking at the buy menu<br>When I am looking at the grid of sell order items<br>Then the grid has a suitable amount of columns for the current grid size | `[!!danger:Coding]`             |

---
# Github Issues
Epic Issue: [#3](https://github.com/JackFawthorpe/FoodRTS/issues/3)
Grooming Ticket: None
Required:
 - [#5](https://github.com/JackFawthorpe/FoodRTS/issues/5) - UX Design
 - [#6](https://github.com/JackFawthorpe/FoodRTS/issues/6) - User Interface DD [[User Interface Framework]] 
- [#9](https://github.com/JackFawthorpe/FoodRTS/issues/9) - Fonting for Game
- [#10](https://github.com/JackFawthorpe/FoodRTS/issues/10) - Food Card
- [#11](https://github.com/JackFawthorpe/FoodRTS/issues/11) - Selected Food Functionality
- [#12](https://github.com/JackFawthorpe/FoodRTS/issues/12) - Button functionality Code
- [#22](https://github.com/JackFawthorpe/FoodRTS/issues/22) - FoodSupplier and SellOrder Implementation [[Food Object Representation]]
- [#43](https://github.com/JackFawthorpe/FoodRTS/issues/43) - Dynamic Sell Order Grid Sizing
Optional:
- [#8](https://github.com/JackFawthorpe/FoodRTS/issues/8) - Stylized Menus
---
# Notes
Pre-requisite to [[Receiving Goods]] Feature
Needs some elaboration on [[Food]] to represent Food