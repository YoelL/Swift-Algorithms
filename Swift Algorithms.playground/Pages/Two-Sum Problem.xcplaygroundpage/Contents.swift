//: [Previous](@previous)

import Foundation
//The Two Sum Problem: return a Boolean if there are two numbers in the array that equal a sum
let numbers = [1,2,3,4,5,6,7,12,15,20,23]

// 1. Brute Force - Nested For-Loop compare all -> Time Complexity O(n²)

func bruteForceTwoSum(array:[Int],sum:Int)-> Bool {
	
	
	for i in 0..<array.count {
		
		for j in 0..<array.count where j != i {
			
			let number1 = array[j]
			let number2 = array[i]
			
			if ( number1 + number2 ) == sum {
				print("√ \(array[j]) + \(array[i]) = \(sum) is True")
				return true
			}else{
				print("X \(array[j]) + \(array[i]) = \(sum) is False")
			}

		}

	}
	return false
}
//Example 1
print(" #Two Sum Brute Force Solution: ","\n")
bruteForceTwoSum(array: numbers, sum: 11)



//2. Binary Search for compliment (Beacuse its sorted) -> Complexity Avg(n log n)

func twoSumBinarySearch(array:[Int],sum:Int)-> Bool {
	
	if array.count == 0 { return false }
	
	for i in 0..<array.count{
		
		let compliment = sum - array[i]
		var tempArray = array
			tempArray.remove(at: i)
		
		let hasCompliment = binarySearch(array: numbers, searchValue: compliment)
			//print("num: \(array[i]) - \(hasCompliment))")
		
		if hasCompliment == true{
			print("Found -> num: \(array[i]) + compliment: \(compliment) = \(sum)")
			return true
		}
		
		
	}
	
	return false
}

//Example 2
print("\n","#Two Sum Binary Search Solution:","\n")
twoSumBinarySearch(array: numbers, sum: 11)


// 3. Move pointer from either end - Linear complexity
func twoSumPointers(array:[Int],sum:Int)-> Bool {
	
	var lowIndex = 0
	var highIndex = array.count - 1
	
	while lowIndex < highIndex {
		
		let sumOfItems = array[lowIndex] + array[highIndex]
		
		if sumOfItems == sum {
			
			print("Sum of \(array[lowIndex]) + \(array[highIndex]) = \(sum)")
			return true
		}else if sumOfItems < sum {
			lowIndex += 1
		}else if sumOfItems > sum {
			highIndex -= 1
		}
	}
	return false
}

//Example 3
print("\n","#Two Sum Pointers Solution:","\n")
twoSumPointers(array: numbers, sum: 3)





//MARK: - Helpers

func binarySearch(array:[Int],searchValue:Int)-> Bool{
	
	if array.count == 0 { return false }
	
	let minIndex = 0
	let maxIndex = array.count - 1
	let midIndex = maxIndex/2
	let midValue = array[midIndex]
	
	
	if searchValue < array[minIndex] || searchValue > array[maxIndex]{
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



//: [Next](@next)
