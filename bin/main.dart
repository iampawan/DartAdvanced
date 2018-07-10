import 'package:dart_code/customers.dart';

main() {
  //LINQ
  //Langauge Integrated Query
  //Functional Collections
  var numbers = [11, 7, 1, 2, 0, 9, 4, 5, 8, 6];
  var numbers2 = [11, 13, 12, 12];

  var result = customers
      .where((c) => c.age < 30)
      .map((c) => c.customerName)
      .elementAt(2);

  print(result);
}
