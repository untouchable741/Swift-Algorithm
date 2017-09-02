//: Playground - noun: a place where people can play


class Node: CustomStringConvertible {
    var value: Int?
    var leftNode: Node?
    var rightNode: Node?
    
    init(value: Int) {
        self.value = value
    }
    
    public var description: String {
        guard let value = self.value else {
            return ""
        }
        return "Left[\(leftNode?.value)] - Node[\(value)] - Right[\(rightNode?.value)]"
    }
}

class BinaryTree{
    var root: Node?
    
    func insert(value: Int) {
        let nodeToInsert = Node(value: value)
        if root == nil {
            root = nodeToInsert
            return
        }
        self.traverseTreeToInsertNode(nodeToInsert: nodeToInsert, intoNode: root)
    }
    
    func traverseTreeToInsertNode(nodeToInsert: Node?, intoNode traversingNode: Node?) {
        
        guard let nodeToInsertValue = nodeToInsert?.value,
              let traversingNodeValue = traversingNode?.value else {
                return
        }
        
        if nodeToInsertValue < traversingNodeValue {
            if traversingNode?.leftNode == nil {
                traversingNode?.leftNode = nodeToInsert
            }
            else {
                traverseTreeToInsertNode(nodeToInsert: nodeToInsert, intoNode: traversingNode?.leftNode)
            }
        }
        else {
            if traversingNode?.rightNode == nil {
                traversingNode?.rightNode = nodeToInsert
            }
            else {
                traverseTreeToInsertNode(nodeToInsert: nodeToInsert, intoNode: traversingNode?.rightNode)
            }
        }
    }
    
    func log() {
        traverseTreeToLog(node: root)
    }
    
    func traverseTreeToLog(node: Node?) {
        guard let validNode = node else {
            return
        }
        
        traverseTreeToLog(node: node?.leftNode)
        
        traverseTreeToLog(node: node?.rightNode)
        
        print(validNode)
    }
}


var tree = BinaryTree()
tree.insert(value: 23)
tree.insert(value: 11)
tree.insert(value: 2)
tree.insert(value: 99)
tree.insert(value: 24)
tree.log()
