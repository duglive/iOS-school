class MyClass<T> {
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
}

struct MyStruct<T> {
    private var ref: MyClass<T>
    
    init(_ value: T) {
        self.ref = MyClass(value)
    }
    
    var value: T {
        get { ref.value }
        set {
            guard isKnownUniquelyReferenced(&ref) else {
                ref = MyClass(newValue)
                
                return
            }
            
            ref.value = newValue
        }
    }
}

extension MyStruct: CustomStringConvertible {
    var description: String {
        return "\(ref.value)"
    }
}

var s1 = MyStruct<String>("Hello Sber")
var s2 = s1 // Ссылается
s2.value = "Hello Tinkoff" // Копируется
print(s1)
print(s2)
