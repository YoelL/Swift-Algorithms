//: [Previous](@previous)

//:# Recursive Search through Binary Tree

import UIKit

class Node{

	let value:Int
	var leftChild:Node?
	var rightChild:Node?
	
	init(value:Int ,leftChild:Node?,rightChild:Node?) {
		self.value = value
		self.leftChild = leftChild
		self.rightChild = rightChild
	}
}

//left branch
let oneNode = Node(value: 1, leftChild: nil, rightChild: nil)
let fiveNode = Node(value: 5, leftChild: oneNode, rightChild: nil)

//right branch

let elevenNode = Node(value: 11, leftChild: nil, rightChild: nil)
let twentyNode = Node(value: 20, leftChild: oneNode, rightChild: nil)
let fourteenNode = Node(value: 14, leftChild: elevenNode, rightChild: twentyNode)
let tenRootNode = Node(value: 10, leftChild: fiveNode, rightChild: fourteenNode)

func search(node:Node?,searchValue:Int)-> Bool{

	if node == nil {return false}
	
	if node?.value == searchValue { return true }

	if searchValue < node!.value {
		return search(node: node?.leftChild, searchValue: searchValue)
	}
	
	return search(node: node?.rightChild, searchValue: searchValue)
}


search(node: tenRootNode, searchValue: 20)
print(" Binary search tree is on average an O(log n)","\n")
//: [Next](@next)
