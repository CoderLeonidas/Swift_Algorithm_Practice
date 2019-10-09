//: [Previous](@previous)

import Foundation

var str = "Two-way linked list"

public class LinkedListNode <T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?

    public init(value: T) {
        self.value = value
    }
}

public class TwoWayLindedList <T> {
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    public func isEmpty() -> Bool {
        return head == nil
    }
    
    public var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
        
    public var first : Node? {
        return head
    }
    
    public var last : Node? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        
        return node
    }
    
    public func node(at index: Int) -> Node? {
        guard index >= 0 && index < count else { return nil }
        
        if index == 0  { return first }
        if index == count - 1  { return last }
        var step = 0
        var node: Node = head!
        while node.next != nil && step < index {
                node = node.next!
            step += 1
        }

        return node
    }
    
    public func appendToTail(value: T) {
        let node = Node(value: value)
        guard head != nil else {
            head = node
            return
        }
        last?.next = node
        node.previous = last
    }
    
    public func insertToHead(value: T) {
        let node = Node(value: value)
        guard head != nil else {
            head = node
            return
        }
        head?.previous = node
        node.next = head
        head = node
    }
    
    public func insert(node: Node, at index: Int) {
        guard (index >= 0 && index < count  && count > 0) || count == 0 && index == 0 else {
            return
        }

        if count == 0 {
            head = node
            return
        }
        
        if index == 0 {
            head?.previous = node
            node.next = head
            head = node
            
        } else if index == count - 1 {
            last?.next = node
            node.previous = last
        } else {
            let curNode = self.node(at: index)
            let prevNode = curNode?.previous
            
            node.previous = prevNode
            prevNode?.next = node
            
            curNode?.previous = node
            node.next = curNode
        }
    }
    
    public func removeAll() {
        head = nil
    }
    
    public func remove(node: Node) -> T? {
        guard !isEmpty() else {
            return nil
        }
        let preNode = node.previous
        let nextNode = node.next

    
        // 如果是头结点
        if preNode == nil && nextNode != nil {
            nextNode?.previous = nil
            head = nextNode
        } else
        // 如果是尾节点
        if nextNode == nil && preNode != nil {
            preNode?.next = nil
        } else
        // 如果头尾都没有指向，也就是说是个新节点
        if preNode == nil && nextNode == nil {

        } else {
            preNode?.next = nextNode
            nextNode?.previous = preNode
            node.previous = nil
            node.next = nil
        }
        
        return node.value
    }
    
    public func remove(at index: Int) -> T? {
        guard count > 0 && index <= count - 1 else {
            return nil
        }
        
        let node = self.node(at: index)
        self.remove(node: node!)
        return node?.value
    }
    
    public func removeLast() -> T? {
        guard !isEmpty() else { return nil }

        return self.remove(node: last!)
    }


    public func printAllNodes(){
        guard head != nil else {
            print("linked list is empty")
            return
        }

        var node = head

        print("\nstart printing all nodes:")

        for index in 0..<count {

            if node == nil {
                break
            }

            print("[\(index)]\(node!.value)")
            node = node!.next

        }
    }

}

var linkedList = TwoWayLindedList<Int>()
linkedList.insertToHead(value: 1)
linkedList.insertToHead(value: 2)
linkedList.insertToHead(value: 3)
linkedList.insertToHead(value: 4)
linkedList.insertToHead(value: 5)

linkedList.printAllNodes()

linkedList.remove(node: linkedList.last!)
linkedList.printAllNodes()

linkedList.remove(node: linkedList.first!)
linkedList.printAllNodes()

linkedList.removeLast()
linkedList.printAllNodes()

linkedList.appendToTail(value: 0)
linkedList.printAllNodes()


//: [Next](@next)
