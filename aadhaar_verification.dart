bool validateVerhoeff(String number) {
  // Define the multiplication table for the permutation step
  final List<List<int>> multiplicationTable = [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
    [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
    [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
    [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
    [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
    [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
    [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
    [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
    [9, 8, 7, 6, 5, 4, 3, 2, 1, 0],
  ];

  // Define the permutation table for the verification step
  final List<int> permutationTable = [0, 4, 3, 2, 1, 5, 6, 7, 8, 9, 10, 11];
  // Check that the number is exactly 12 digits long
  if (number.length != 12) {
    return false;
  }
  // Initialize the checksum to 0
  int checksum = 0;

  // Reverse the number and convert it to a list of integers
  final List<int> reversedNumber =
      number.split('').map(int.parse).toList().reversed.toList();

  // Perform the permutation and multiplication steps
  for (int i = 0; i < reversedNumber.length; i++) {
    final int digit = reversedNumber[i];
    final int row = i % 8;
    final int col = multiplicationTable[row][digit];
    checksum = permutationTable[checksum ^ col];
  }

  // If the final checksum is 0, the number is valid
  return checksum == 0;
}

void main() {
  final String number = '608630814943';
  final bool isValid = validateVerhoeff(number);

  if (isValid) {
    print('$number is valid');
  } else {
    print('$number is not valid');
  }
}
