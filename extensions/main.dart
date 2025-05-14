extension StringNullExtension on String? {
  String nonNullValue([String defaultValue = '']) {
    return this ?? defaultValue;
  }
}

extension IntNullExtension on int? {
  int nonNullValue([int defaultValue = 0]) {
    return this ?? defaultValue;
  }
}

extension BoolNullExtension on bool? {
  bool nonNullValue([bool defaultValue = false]) {
    return this ?? defaultValue;
  }
}

extension DateTimeExtension on DateTime {
  bool get isWeekend {
    return (this.weekday == DateTime.saturday 
      || this.weekday == DateTime.sunday);
  }
}

void main() {
  String? name = null;
  int? age = null;
  bool? isStudent = null;
  DateTime date = DateTime.now();
  
  print(name.nonNullValue());       // Output: ""
  print(age.nonNullValue());        // Output: 0
  print(isStudent.nonNullValue());  // Output: false
  print(date.isWeekend);            // Output: true or false
}
