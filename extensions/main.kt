fun String?.nonNullValue(defaultValue: String = ""): String {
    return this ?: defaultValue
}

fun Int?.nonNullValue(defaultValue: Int = 0): Int {
    return this ?: defaultValue
}

fun Boolean?.nonNullValue(defaultValue: Boolean = false)
: Boolean {
    return this ?: defaultValue
}

fun main() {
    val name: String? = null
    val age: Int? = null
    val isStudent: Boolean? = null
    
    println(name.nonNullValue())       // Output: ""
    println(age.nonNullValue())        // Output: 0
    println(isStudent.nonNullValue())  // Output: false
}