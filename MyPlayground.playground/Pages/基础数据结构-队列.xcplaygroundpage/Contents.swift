//: [Previous](@previous)

import Foundation

var str = "Queue"

struct Queue <T> {
    fileprivate var items: [T]
    init() {
        items = [T]()
    }
    public mutating func enqueue(item: T) {
        items.append(item)
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty() else {
            return nil
        }
        let tail = items.first
        items.removeFirst()
        return tail
    }
    
    public func count() -> Int {
        return items.count
    }
    
    public func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    public func head() -> T? {
        guard !isEmpty() else { return nil }
        
        return items.first
    }
    
    public func tail() -> T? {
        guard !isEmpty() else { return nil }

        return items.last
    }
    
    public func debugPring() {
        guard count() > 0 else {
            print("queue is empty")
            return
        }
        
        print("\nprint all queue elemets:")
        for (index, value) in items.enumerated() {
            print("[\(index)]\(value)")
        }
    }
}

var queue = Queue<Int>()
queue.debugPring()

queue.enqueue(item: 1)
queue.enqueue(item: 2)
queue.enqueue(item: 3)
queue.count()
queue.debugPring()

queue.dequeue()
queue.debugPring()

queue.dequeue()
queue.debugPring()

queue.dequeue()
queue.debugPring()








