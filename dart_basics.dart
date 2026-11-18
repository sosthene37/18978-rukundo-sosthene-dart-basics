// Student: Rukundo sosthene
// Reg no: 18978

const String regNo = '18978';

final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by RS
  text = text.toLowerCase();

  int count = 0;
  int i = 0;

  while (i < text.length) {
    if ('aeiou'.contains(text[i])) {
      count++;
    }
    i++;
  }

  return count;
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');
  print('Rukundo sosthene has ${countVowels("Rukundo sosthene")} vowels');
}