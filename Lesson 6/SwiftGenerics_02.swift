protocol Container : CustomStringConvertible {
    associatedtype Item
    
    var items: Array<Item> { get set }
    var count: Int { get }
    var isEmpty: Bool { get }
    var description: String { get }
    
    mutating func add(_ item: Item)
    mutating func clear()
    mutating func peek() -> Item?
    
    subscript(i: Int) -> Item { get }
}

extension Container {
    var count: Int { items.count }
    var isEmpty: Bool { items.isEmpty }
    var description: String { items.description }
    
    mutating func add(_ item: Item) { items.append(item) }
    mutating func clear() { items.removeAll() }
    
    subscript(i: Int) -> Item { items[i] }
}

struct Stack<T> : Container {
    var items = Array<T>()
    
    mutating func pop() -> T? {
        return items.popLast()
    }
    
    mutating func peek() -> T? {
        return items.last
    }
}

struct Queue<T> : Container {
    var items = Array<T>()
    
    mutating func dequeue() -> T? {
        return items.removeFirst()
    }
    
    mutating func peek() -> T? {
        return items.first
    }
}
