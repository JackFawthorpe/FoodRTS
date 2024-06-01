@tool
extends Node

## Assumes both lists are the same size, allows iterating through two lists at once
func zip(arr1: Array, arr2: Array):
	var result = []
	for i in range(result.size()):
		result.append([arr1[i], arr2[i]])
	return result

## Creates a dereferencable enumeration of index and item
func enumerate(arr: Array):
	var result = []
	for idx in range(arr.size()):
		result.append([idx, arr[idx]])
	return result

## Frees all the children for a given node
func free_children(parent: Node):
	for child in parent.get_children():
		child.queue_free()
