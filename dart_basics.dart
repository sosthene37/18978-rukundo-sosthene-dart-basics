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

String initials(String fullName) {
  // by RS
  fullName = fullName.trim();

  if (fullName.isEmpty) return '';

  List<String> parts = fullName.split(RegExp(r'\s+'));

  String result = '';

  int i = 0;
  while (i < parts.length) {
    result += '${parts[i][0].toUpperCase()}.';
    i++;
  }

  return result;
}

void drawTriangle(int height) {
  // by RS

  if (height <= 0) return;

  int row = 1;

  while (row <= height) {
    int spaces = height - row;

    String line = '';

    int s = 0;
    while (s < spaces) {
      line += ' ';
      s++;
    }

    String symbol = row % 2 == 1 ? '*' : '#';

    int c = 0;
    while (c < row) {
      line += symbol;
      c++;
    }

    print(line);

    row++;
  }
}

int momoFee(int amount) {
  // by RS

  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;

  return 1500;
}

String maskPhone(String phone) {
  // by RS

  if (phone.length != 10) {
    return 'INVALID';
  }

  String stars = '';

  int i = 0;

  while (i < 5) {
    stars += '*';
    i++;
  }

  return phone.substring(0, 3) +
      stars +
      phone.substring(phone.length - 2);
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  print('Rukundo sosthene has ${countVowels("Rukundo sosthene")} vowels');

  print(initials('Rukundo sosthene'));
  print(initials(' ana uwase '));
  print(initials(' '));

  drawTriangle(d + 3);

  int i = 1;
  int totalFees = 0;

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;

    int fee = momoFee(amount);

    totalFees += fee;

    print(
      'Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone("0788123456")}',
    );

    i++;
  }

  print('Total fees: $totalFees RWF');
}
