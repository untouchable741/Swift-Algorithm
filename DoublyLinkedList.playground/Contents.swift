//: Playground - noun: a place where people can play

class Node<T: Equatable>: CustomStringConvertible {
    var value: T?
    weak var previous: Node<T>?
    var next: Node<T>?
    
    init(){}
    
    init(value: T) {
        self.value = value
    }
    
    public var description: String {
        guard let value = self.value else {
            return ""
        }
        
        return "Node[\(value)]"
    }
}

class LinkedList<T: Equatable> {
    var head: Node<T>? = nil
    var tail: Node<T>? = nil
    
    func append(value: T) {
        var node = head
        let newNode = Node<T>(value: value)
        
        if (node == nil) {
            head = newNode
            return
        }
    
        while(node?.next != nil) {
            node = node?.next
        }
        
        node?.next = newNode
        newNode.previous = node
        tail = newNode
    }
    
    func findNode(value: T) -> Node<T>? {
        var node = head
        while(node != nil) {
            if node?.value == value {
                return node
            }
            node = node?.next
        }
        
        return nil
    }
    
    func removeNode(value: T) -> Bool {
        var node = head
        
        if (node?.value == value) {
            head = node?.next
            return true
        }
        
        while(node != nil) {
            if node?.value == value {
                let previousNode = node?.previous
                previousNode?.next = node?.next
                node?.next?.previous = previousNode
                return true
            }
            node = node?.next
        }
        return false
    }
    
    func log() {
        var node = head
        while(node != nil) {
            print(node)
            node = node?.next
        }
    }
}

var list = LinkedList<Int>()

list.append(value: 99)
list.append(value: 12)
list.append(value: 34)
list.append(value: 1)
list.append(value: 228)
list.append(value: 112)
print("===== LOG ALL NODES =====")
list.log()
print("===== LOG THE HEAD =====")
print(list.head)
print("===== LOG THE TAIL =====")
print(list.tail)
print("===== FIND NODE WITH VALUE =====")
print(list.findNode(value: 34)?.previous)
print(list.findNode(value: 34)?.next)
print("===== REMOVE NODE WITH VALUE =====")
list.removeNode(value: 99)
list.log()





