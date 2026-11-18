// Student: Rukundo sosthene
// Reg no: 18978

const String regNo = '18978';

final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by RS

  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;

  return 1500;
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');
}