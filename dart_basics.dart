// Student: Rukundo sosthene
// Reg no: 18978
const String regNo = '18978';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by RS
  final String normalized = text.toLowerCase();
  int count = 0;
  int i = 0;
  while (i < normalized.length) {
    if ('aeiou'.contains(normalized[i])) count++;
    i++;
  }
  return count;
}

String initials(String fullName) {
  // by RS
  final List<String> names = fullName.trim().split(RegExp(r'\s+'));
  if (fullName.trim().isEmpty) return '';
  String result = '';
  int i = 0;
  while (i < names.length) {
    result += '${names[i][0].toUpperCase()}.';
    i++;
  }
  return result;
}

void drawTriangle(int height) {
  // by RS
  int row = 1;
  while (row <= height) {
    String line = '';
    int spaces = height - row;
    while (spaces > 0) {
      line += ' ';
      spaces--;
    }
    final String symbol = row.isEven ? '#' : '*';
    int count = 0;
    while (count < row) {
      line += symbol;
      count++;
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
  if (phone.length != 10) return 'INVALID';
  return '${phone.substring(0, 3)}*****${phone.substring(8)}';
}

void main() {
  // by RS
  print('Reg no: $regNo | D = $d | T = $t');
  print('Rukundo sosthene has ${countVowels('Rukundo sosthene')} vowels');
  print(initials('Rukundo sosthene'));
  print(initials(' ana uwase '));
  print(initials(' '));
  print('Triangle height = ${d + 3}');
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  int totalFees = 0;
  int i = 1;
  while (i <= d + 3) {
    final int amount = i * 4000 + t * 100;
    final int fee = momoFee(amount);
    totalFees += fee;
    print(
      'Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone('0788123456')}',
    );
    i++;
  }
  print('Total fees: $totalFees RWF');
}
