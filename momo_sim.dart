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

String formatRwf(int amount) {
  // by RS
  final bool negative = amount < 0;
  final String digits = amount.abs().toString();
  String grouped = '';
  int i = 0;
  while (i < digits.length) {
    if (i > 0 && (digits.length - i) % 3 == 0) grouped += ',';
    grouped += digits[i];
    i++;
  }
  return '${negative ? '-' : ''}$grouped RWF';
}

bool isValidPin(String pin) {
  // by RS
  if (pin.length != 5 || pin == '12345') return false;
  int i = 0;
  while (i < pin.length) {
    if (pin.codeUnitAt(i) < 48 || pin.codeUnitAt(i) > 57) return false;
    i++;
  }
  if (pin[0] == pin[1] &&
      pin[1] == pin[2] &&
      pin[2] == pin[3] &&
      pin[3] == pin[4])
    return false;
  return true;
}

int sendMoney(int balance, int amount) {
  // by RS
  final int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  final int newBalance = balance - amount - fee;
  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}',
  );
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by RS
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime amount must be from 100 to 50,000 RWF');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  final int newBalance = balance - amount;
  print(
    'Bought airtime ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}',
  );
  return newBalance;
}

void main() {
  // by RS
  print('Reg no: $regNo | D = $d | T = $t');
  print("PIN '12345': ${isValidPin('12345')}");
  print("PIN '77777': ${isValidPin('77777')}");
  print("PIN '4821': ${isValidPin('4821')}");
  print("PIN '48a21': ${isValidPin('48a21')}");
  print("PIN '4821$d': ${isValidPin('4821$d')}");

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');
  final int sendAmount = (d + 1) * 3000;
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);
  print('Final balance: ${formatRwf(balance)}');

  print(formatRwf(0)); // Expected: 0 RWF
  print(formatRwf(999)); // Expected: 999 RWF
  print(formatRwf(1000)); // Expected: 1,000 RWF
  print(formatRwf(-5000)); // Expected: -5,000 RWF (sign and grouping edge case)
  print(isValidPin('54321')); // Expected: true
  print(isValidPin('11112')); // Expected: true (not all five digits match)
  print(isValidPin('22222')); // Expected: false (repeated digit edge case)
  print(isValidPin('12')); // Expected: false (too short)
  print(isValidPin('12A34')); // Expected: false (non-digit character)
}
