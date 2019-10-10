//: [Previous](@previous)

import Foundation

var str = "quickSort"

var arr:[Int] = Array()

func quickSort(datas:[Int]) ->[Int]{
    arr = datas
    recursiveQuickSort(l: 0, r: arr.count-1)
    return arr
}

//递归排序
private
func recursiveQuickSort(l: Int, r: Int) {
    if l >= r {
        return
    }

    let p = partition(l: l, r: r)
    recursiveQuickSort(l: l, r: p-1)
    recursiveQuickSort(l: p+1, r: r)
}


//对arr[l...r]部分进行partition
//返回p，使得arr[l...p-1] < arr[p]  arr[p+1...r] > arr[p]
private
func partition(l:Int,r:Int) -> Int {
    let v = arr[l]

    //arr[l+1...j] < v   arr[j+1...i] > v
    var j = l
    for i in l+1...r {
        if arr[i] > v {
            j += 1
            arr.swapAt(j, i)
        }
    }

    arr.swapAt(l, j)
    print(l,j)
    return j
}

let data = [4,6,2,1,5,3,7,8]
let res = quickSort(datas: data)
print(res)

//: [Next](@next)
