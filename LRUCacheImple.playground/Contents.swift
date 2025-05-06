import UIKit

class LRUCache {
    private class Node {
        var key: Int
        var value: Int
        var prev: Node?
        var next: Node?
        init(_ key: Int, _ value: Int) {
            self.key = key
            self.value = value
        }
    }
    
    private var capacity: Int = 0
    private var dict = [Int: Node]()
    private var head = Node(0, 0)
    private var tail = Node(0, 0)
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        
        if let node = dict[key] {
            moveToHead(node)
            return node.value
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.value = value
            moveToHead(node)
        }else {
            let newNode = Node(key, value)
            dict[key] = newNode
            addNode(newNode)
            
            if dict.count > capacity {
                if let tailNode = removeTill() {
                    dict.removeValue(forKey: tailNode.key)
                }
            }
        }
    }
    
    
    private func addNode(_ node: Node){
        node.prev = head
        node.next = head.next
        head.next?.prev = node
        head.next = node
    }
    
    private func removeNode(_ node: Node){
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    private func moveToHead(_ node: Node) {
        removeNode(node)
        addNode(node)
    }
    
    private func removeTill() -> Node? {
        if let node = tail.prev, node !== head {
            removeNode(node)
            return node
        }
        return nil
    }
    
    
}


//Example

//🧠 What’s Happening:
//You insert keys 1 and 2.
//
//When inserting 3 (capacity exceeded), the least recently used key (2) is removed.
//
//When inserting 4, key 1 is removed (as it’s the least recently used after the previous access).
//
//You can verify behavior by observing which keys are available using get().


let cache = LRUCache(2) // Capacity is 2
cache.put(1, 10)
cache.put(2, 20)
print(cache.get(1))

cache.put(3, 30)
print(cache.get(2))

cache.put(4, 40)
print(cache.get(1))
print(cache.get(3))
print(cache.get(4))

