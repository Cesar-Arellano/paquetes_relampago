void main() {
  final result = isValidName('César Arellano');
  print(result);
}

bool isValidName(String? name) {
  if (name == null) return false;
  if (name.isEmpty) return false;
  if (name.length <= 2) return false;

  return true;
}