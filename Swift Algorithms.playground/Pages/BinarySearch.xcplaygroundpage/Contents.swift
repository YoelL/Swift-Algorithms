//: [Previous](@previous)

//:# Binary Search

import Foundation


let sortedArray = [1,3,5,7,8,9,10,13,15,16,17,18,24,27,29,31,33,34,35,36,37,40]

func binarySearch(array:[Int],searchValue:Int)-> Bool{
	
	if array.count == 0 { return false }
	
	let minIndex = 0
	let maxIndex = array.count - 1
	let midIndex = maxIndex/2
	let midValue = array[midIndex]
	
	
	if searchValue < array[minIndex] || searchValue > array[maxIndex]{
		print("\(searchValue) does not exist in the array")
		return false
	}
	
	if searchValue > midValue {
		let slicedArray = Array(array[midIndex + 1...maxIndex])
		return binarySearch(array: slicedArray, searchValue: searchValue)
	}
	
	
	if searchValue < midValue {
		let slicedArray = Array(array[minIndex...midIndex - 1])
		return binarySearch(array: slicedArray, searchValue: searchValue)
	}
	
	if searchValue == midValue {
		print("\(searchValue) was found in the array")
		return true
	}
	
	return false
	
}


//Example
binarySearch(array: sortedArray, searchValue: 27)

//: [Next](@next)
