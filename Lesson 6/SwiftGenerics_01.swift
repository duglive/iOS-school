extension String : AdditiveArithmetic {
    public static func - (lhs: String, rhs: String) -> String { "" }
    public static var zero: String { "" }
}

func sum<T: AdditiveArithmetic>(_ a: T, _ b: T) -> T { a + b }

print(sum(3, 2))
print(sum(3.5, 2.4))
print(sum("ABC", "DEF"))

// Можно было просто перегрузить метод sum
// func sum<T: RangeReplaceableCollection>(_ a: T, _ b: T) -> T { a + b }
