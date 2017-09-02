//: Playground - noun: a place where people can play

class Node<T: Equatable>: CustomStringConvertible {
    var value: T? = nil
    var next: Node<T>? = nil
    
    init() { }
    
    init(value: T) {
        self.value = value
    }
    
    public var description: String {
        if let value = self.value {
            return "Node[\(value)]"
        }
        return ""
    }
}

class LinkedList<T: Equatable> {
    var head: Node<T>? = Node<T>()
    
    func nodeCount() -> Int {
        var nodeCount = 0
        var currentNode: Node<T>? = head
        while(currentNode?.next != nil) {
            currentNode = currentNode?.next
            nodeCount = nodeCount + 1
        }
        return nodeCount
    }
    
    func insert(value: T) {
        if (self.head?.value == nil) {
            self.head?.value = value
        }
        else {
            let nodeToInsert = Node<T>(value: value)
            if let lastNode = self.lastNode() {
                lastNode.next = nodeToInsert
            }
            else {
                head?.next = nodeToInsert
            }
        }
    }
    
    func log() {
        var node: Node<T>? = head
        repeat {
            print(node)
            node = node?.next
        } while(node?.value != nil)
    }
    
    func findNode(value: T) -> Node<T>? {
        var node: Node<T>? = head
        while(node?.next != nil) {
            if (node?.value == value) {
                return node
            }
            node = node?.next
        }
        print("There is no node with value \(value)")
        return nil
    }
    
    func findNodeAt(index: Int) -> Node<T>? {
        var currentNodeIndex = 0
        var node: Node<T>? = head
        while(node?.next != nil) {
            if (currentNodeIndex == index) {
                return node
            }
            currentNodeIndex += 1
            node = node?.next
        }
        print("There is no node at index \(index)")
        return nil
    }
    
    func removeNode(value: T) -> Bool {
        var currentNode: Node<T>? = head
        var nextNode: Node<T>? = currentNode?.next
        
        if (head?.value == value) {
            head = nextNode
            return true
        }
        
        while(nextNode != nil) {
            if (nextNode?.value == value) {
                //Delete node here
                currentNode?.next = nextNode?.next
                return true
            }
            else {
                currentNode = nextNode
                nextNode = currentNode?.next
            }
        }
        return false
    }
    
    func removeNodeAt(index: Int) -> Bool {
        var currentNodeIndex = 0
        var currentNode: Node<T>? = head
        var nextNode: Node<T>? = currentNode?.next
        
        if (index == 0) {
            head = nextNode
            return true
        }
        
        while(nextNode != nil) {
            if (currentNodeIndex == index) {
                currentNode?.next = nextNode?.next
                return true
            }
            else {
                currentNode = nextNode
                nextNode = currentNode?.next
                currentNodeIndex += 1
            }
        }
        return false
    }
    
    private func lastNode() -> Node<T>? {
        var lastNode: Node<T>? = head
        while(lastNode?.next != nil) {
            lastNode = lastNode?.next
        }
        return lastNode
    }
}

let list = LinkedList<Int>()
list.insert(value: 5)
list.insert(value: 2)
list.insert(value: 99)
list.insert(value: 22)
list.insert(value: 11)

print("===== LOG ALL NODES =====")
list.log()

print("===== FIND NODE WITH VALUE =====")
list.findNode(value: 99)

print("===== FIND NODE WITH INDEX =====")
list.findNodeAt(index: 0)

print("===== REMOVE NODE WITH VALUE ====")
list.removeNode(value: 5)
list.log()

print("===== REMOVE NODE WITH INDEX =====")
list.removeNodeAt(index: 0)
list.log()

print("===== END =====")
