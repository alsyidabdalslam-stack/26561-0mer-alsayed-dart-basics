// Name: Alsayed Abdalsalam Omer
// Reg No: 26561 | D = 1 | T = 61

// ---------- B2 ----------
int countVowels(String text) {
  // by AAO
  String lower = text.toLowerCase(); // makes capital letters count
  int count = 0;
  for (int i = 0; i < lower.length; i++) {
    if ('aeiou'.contains(lower[i])) count++;
  }
  return count;
}

// ---------- D2 ----------
int momoFee(int amount) {
  // by AAO
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  // by AAO
  if (phone.length != 10) return 'INVALID';
  String stars = '';
  int i = 0;
  while (i < phone.length - 5) {
    stars += '*';
    i++;
  }
  return phone.substring(0, 3) + stars + phone.substring(phone.length - 2);
}

void main() {
  // by AAO
  // B2
  String name = 'Alsayed Abdalsalam Omer';
  print('$name has ${countVowels(name)} vowels');

  // D2
  int d = 1;
  int t = 61;
  int i = 1;
  int total = 0;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    total += fee;
    print(
      'Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone('0788123456')}',
    );
    i++;
  }
  print('Total fees: $total RWF');
}
