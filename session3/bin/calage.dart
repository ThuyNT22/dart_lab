import 'dart:io';

void main() {
  print('Input your name:');
  String? name = stdin.readLineSync();

  print('Input your birthday (dd/MM/yyyy):');
  String? birthDateInput = stdin.readLineSync();

  if (name != null && birthDateInput != null) {
    DateTime? birthDate = parseDate(birthDateInput);

    if (birthDate != null) {
      DateTime today = DateTime.now();
      int age = calculateAge(birthDate, today);
      int yearsToHundred = 100 - age;

      print('Hello $name!');
      print('You are $age years old.');

      if (isBirthday(birthDate, today)) {
        print('Happy birth day!');
      }

      print('You will be 100 years old after $yearsToHundred years.');
    } else {
      print('Please input your birthday dd/MM/yyyy.');
    }
  } else {
    print('Please input your name & your birthday');
  }
}

DateTime? parseDate(String dateString) {
  try {
    return DateTime.parse(
        dateString.split('/').reversed.join('-') + 'T00:00:00Z');
  } catch (e) {
    return null;
  }
}

int calculateAge(DateTime birthDate, DateTime today) {
  int age = today.year - birthDate.year;
  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }
  return age;
}

bool isBirthday(DateTime birthDate, DateTime today) {
  return birthDate.month == today.month && birthDate.day == today.day;
}
