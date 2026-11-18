// Student: Alsayed Abdalsalam Omer
// Reg no: 26561
const String regNo = '26561';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// ---------- B2 ----------
int countVowels(String text) {
  // by AAO
  String lower = text.toLowerCase(); // makes capital letters count
  int count = 0;
  int i = 0;
  while (i < lower.length) {
    if ('aeiou'.contains(lower[i])) count++;
    i++;
  }
  return count;
}

// ---------- B3 ----------
// First draft (kept as a comment). It breaks on extra spaces:
// String initials(String fullName) {
//   // by AAO
//   String result = '';
//   for (String word in fullName.split(' ')) {
//     result += word[0].toUpperCase() + '.';
//   }
//   return result;
// }
String initials(String fullName) {
  // by AAO
  String result = '';
  bool newWord = true; // true when the next letter starts a new name
  int i = 0;
  while (i < fullName.length) {
    String ch = fullName[i];
    if (ch.trim().isEmpty) {
      newWord = true; // a space: the next letter starts a new word
    } else if (newWord) {
      result += ch.toUpperCase() + '.';
      newWord = false;
    }
    i++;
  }
  return result;
}

// ---------- C5 ----------
void drawTriangle(int height) {
  // by AAO
  int row = 1;
  while (row <= height) {
    String line = '';
    int s = 0;
    while (s < height - row) {
      line += ' '; // spaces = height - row
      s++;
    }
    String ch = row % 2 == 1 ? '*' : '#';
    int k = 0;
    while (k < row) {
      line += ch;
      k++;
    }
    print(line);
    row++;
  }
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
  print('Reg no: $regNo | D = $d | T = $t');

  // B2
  String name = 'Alsayed Abdalsalam Omer';
  print('$name has ${countVowels(name)} vowels');

  // B3
  print("'$name' -> '${initials(name)}'");
  print("' ana uwase ' -> '${initials(' ana uwase ')}'");
  print("' ' -> '${initials(' ')}'");

  // C5
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2
  int i = 1;
  int total = 0;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    total += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone('0788123456')}');
    i++;
  }
  print('Total fees: $total RWF');
}
