indirect enum LinkedListItem<T> {
    case endPoint(value: T)
    case linkNode(value: T, next: LinkedListItem)
}

let third = LinkedListItem.endPoint(value: "Third")
let second = LinkedListItem.linkNode(value: "Second", next: third)
let first = LinkedListItem.linkNode(value: "First", next: second)

var currentNode = first

printList: while true {
    switch currentNode {
    case .endPoint(let value):
        print(value)
        break printList
    case .linkNode(let value, let next):
        print("\(value) ->", terminator: " ")
        currentNode = next
    }
}
