//: [Previous](@previous)

import Foundation

var str = "BinarySearch"


/// 二分查找
/// - Parameter value: 需要查找的值
/// - Parameter array: 查找范围
/// - Parameter begin: 查找的起始下标
/// - Parameter end: 查找的终止下标
func binarySearch(value: Int, in array: [Int], begin: Int, end: Int) -> Int {
    guard array.count > 0 && begin >= end else {
        return NSNotFound
    }
    guard begin >= 0 && begin < array.count - 1 else {
        return NSNotFound
    }
    
    guard end >= 0 && end < array.count - 1 else {
        return NSNotFound
    }
    
    let mid = (begin + end) / 2
    
    if array[mid] == value {
        return mid
    } else if value < array[mid] {
        return binarySearch(value: value, in: array, begin: begin, end: mid - 1)
    } else {
        return binarySearch(value: value, in: array, begin: mid + 1, end: end)
    }
}

var array = [1,2,3,4,5,6,7,8,9]

var index = binarySearch(value: 6, in: array, begin: 0, end: 8)

//: [Next](@next)
