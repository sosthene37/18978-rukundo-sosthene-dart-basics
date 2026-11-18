// Student: Rukundo sosthene
// Reg no: 18978

const String regNo = '18978';

final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

void main() {
  print('Reg no: $regNo | D = $d | T = $t');
}