// Student: Alsayed Abdalsalam Omer
// Reg no: 26561
const String regNo = '26561';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// copied from D2
int momoFee(int amount) {
  // by AAO
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String formatRwf(int amount) {
  // by AAO
  String sign = amount < 0 ? '-' : '';
  String digits = amount.abs().toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    if (count > 0 && count % 3 == 0) result = ',' + result;
    result = digits[i] + result;
    count++;
    i--;
  }
  return '$sign$result RWF';
}

bool isValidPin(String pin) {
  // by AAO
  if (pin.length != 5) return false;
  int i = 0;
  while (i < pin.length) {
    int c = pin.codeUnitAt(i);
    if (c < 48 || c > 57) return false; // not a digit 0-9
    i++;
  }
  if (pin == '12345') return false;
  bool allSame = true;
  i = 1;
  while (i < pin.length) {
    if (pin[i] != pin[0]) allSame = false;
    i++;
  }
  if (allSame) return false;
  return true;
}

int sendMoney(int balance, int amount) {
  // by AAO
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
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by AAO
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime must be 100 to 50,000 RWF');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Bought airtime ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  // by AAO
  print('Reg no: $regNo | D = $d | T = $t');

  // 1. PIN checks
  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));

  // 2. starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // 3. transactions
  int i = 0;
  while (i < 3) {
    balance = sendMoney(balance, (d + 1) * 3000);
    i++;
  }
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // 4. final balance
  print('Final balance: ${formatRwf(balance)}');

  // 5. my own tests (expected output in the comment)
  print(formatRwf(100000)); // 100,000 RWF
  print(formatRwf(-1000000)); // -1,000,000 RWF
  print(formatRwf(-100)); // -100 RWF  (might break: a naive version gives -,100 RWF)
  print(isValidPin('')); // false
  print(isValidPin('00000')); // false (same digit five times)
  print(isValidPin('01234')); // true (a leading zero is allowed)
  print(isValidPin('12 45')); // false (a space is not a digit)
}
