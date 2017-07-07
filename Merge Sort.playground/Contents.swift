//:## Merge Sort Swift 4

import UIKit


//Split Arrays

func mergeSort(array:[Int])->[Int]{
	
	guard array.count > 1 else { return array }
	
	let leftArray = Array(array[0..<array.count/2])
	let rightArray = Array(array[array.count/2..<array.count])
	
	return merge(left: mergeSort(array: leftArray), right: mergeSort(array: rightArray))
	
}



//Merge Arrays
func merge(left:[Int], right:[Int])-> [Int]{
	
	var mergedArray:[Int] = []
	var left = left
	var right = right
	
	while left.count > 0 && right.count > 0  {
		
		if left.first! < right.first! {
			mergedArray.append(left.removeFirst())
		}else{
			mergedArray.append(right.removeFirst())
		}
	}
	return mergedArray + left + right
}


//Running Example
var numbers:[Int] = []

for _ in 0..<50{
	let randomInt = Int(arc4random_uniform(UInt32(777)))
	numbers.append(randomInt)
}

print("Random Array","\n")
print(numbers,"\n")
print("Sorted Array Using Merge Sort","\n")
print(mergeSort(array: numbers),"\n")
print("# In sorting n objects, merge sort has an average and worst-case performance of O(n log n).","\n")




