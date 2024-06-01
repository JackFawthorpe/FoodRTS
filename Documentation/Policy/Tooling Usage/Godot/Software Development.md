This is a set of principles to minimize the amount of bugs that are produced from scripting in Godot

1. Never modify data that is received from a .get method
	  The modification of data from a get method should always be achieved through the use of a setter. This lets the parent always know that a change has occured
1. Never reference a variable within a class without using a get method
	   To guarantee that rule 1 is followed all variables need to be fetched in the same way