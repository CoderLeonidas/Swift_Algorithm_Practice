//: [Previous](@previous)

import Foundation


class Node {
    var value: Int
    var next: Node?
    init(_ value: Int) {
        self.value = value
        next = nil
    }
}

func createList(_ datas: [Int]) -> Node? {
    guard datas.count > 0 else { return nil }
    var head: Node?
    var curNode: Node?
    for data in datas {
        if head == nil {
            curNode = Node(data)
            head = curNode

        } else {
            curNode?.next = Node(data)
            curNode = curNode?.next
        }
        
    }
    return head
}

func printList(_ head: Node?) {
    var node = head
    while node != nil {
        print(node?.value ?? NSNotFound)
        node = node?.next
    }
}

var head = createList([1,2,3,4,5])

printList(head!)

func reverseList(_ head: inout Node?) {
    guard head != nil else {
        return
    }
    var cur = head?.next // 当前节点
    var next = cur?.next // 游标
    var oldhead: Node? // 记录旧的头
    while cur != nil {
        cur?.next = head // 将游标指向当前的头
        head?.next = oldhead // 将当前的头指向旧的头

        oldhead = head // 更新旧的头
        head = cur // 更新当前的头为游标指向的节点
        
        cur = next // 用游标移动当前节点
        next = next?.next // 更新游标
    }
}

reverseList(&head)
print("=====")
printList(head)


//: [Next](@next)
