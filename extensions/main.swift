extension Optional where Wrapped == String {
    func nonNullValue(_ defaultValue: String = "") -> String {
        return self ?? defaultValue
    }
}

extension Optional where Wrapped == Int {
    func nonNullValue(_ defaultValue: Int = 0) -> Int {
        return self ?? defaultValue
    }
}

extension Optional where Wrapped == Double {
    func nonNullValue(_ defaultValue: Double = 0.0) -> Double {
        return self ?? defaultValue
    }
}

extension Optional where Wrapped == Bool {
    func nonNullValue(_ defaultValue: Bool = false) -> Bool {
        return self ?? defaultValue
    }
}


var name: String? = nil
var age: Int? = nil
var height: Double? = nil
var isStudent: Bool? = nil

print(name.nonNullValue()) // Output: ""
print(age.nonNullValue()) // Output: 0
print(height.nonNullValue()) // Output: 0.0
print(isStudent.nonNullValue()) // Output: false
