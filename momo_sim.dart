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

  bool negative = amount < 0;

  String number = amount.abs().toString();

  String result = '';

  int count = 0;
  int i = number.length - 1;

  while (i >= 0) {
    result = number[i] + result;
    count++;

    if (count % 3 == 0 && i > 0) {
      result = ',$result';
    }

    i--;
  }

  if (negative) {
    result = '-$result';
  }

  return '$result RWF';
}

bool isValidPin(String pin) {
  // by RS

  if (pin.length != 5) return false;

  if (pin == '12345') return false;

  int i = 0;

  while (i < pin.length) {
    if (!(pin.codeUnitAt(i) >= 48 &&
        pin.codeUnitAt(i) <= 57)) {
      return false;
    }
    i++;
  }

  bool same = true;
  i = 1;

  while (i < pin.length) {
    if (pin[i] != pin[0]) {
      same = false;
    }
    i++;
  }

  if (same) return false;

  return true;
}

int sendMoney(int balance, int amount) {
  // by RS

  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;

  print(
      'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');

  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by RS

  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print(
      'Bought airtime ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');

  return newBalance;
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('48218'));

  int balance = 20000 + t * 500;

  print('Starting balance: ${formatRwf(balance)}');

  int amount = (d + 1) * 3000;

  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);

  balance = buyAirtime(balance, 1000);

  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  print(formatRwf(0));        // 0 RWF
  print(formatRwf(999));      // 999 RWF
  print(formatRwf(1000));     // 1,000 RWF
  print(formatRwf(1250000));  // 1,250,000 RWF
  print(formatRwf(-5000));    // -5,000 RWF

  print(isValidPin('54321')); // true
  print(isValidPin('11112')); // true
  print(isValidPin('22222')); // false
  print(isValidPin('12'));    // false
  print(isValidPin('12A34')); // false
}