
import Foundation

var str = "栈"

struct Stack <T> {
    fileprivate var items: [T]
    
    init() {
        items = [T]()
    }
    // 栈是否为空
    public func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    public func top() -> T? {
        if isEmpty() {
            return nil
        }
        return items.last
    }
    
    public mutating func pop() {
        guard !isEmpty() else { return }
        
        items.removeLast()
    }
    
    public mutating func push(item: T) -> Void {
        items.append(item)
    }
    
    public func count() -> Int {
        return items.count
    }
    
    public func debugPrint() {
        guard count() > 0 else {
            print("stack is empty")
            return
        }
        
        print("\nprint all stack elemets:")
        for (index, value) in items.enumerated() {
            print("[\(index)]\(value)")
        }
    }
}

var stack = Stack<Int>()
stack.debugPrint()

stack.push(item: 1)
stack.push(item: 100)
stack.count()
stack.debugPrint()

stack.pop()
stack.count()
stack.debugPrint()


stack.push(item: 99)
stack.push(item: 770)
stack.count()
stack.debugPrint()

stack.pop()
stack.pop()
stack.pop()
stack.pop()
stack.pop()
stack.debugPrint()






