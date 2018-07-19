import 'package:dart_code/customers.dart';

void linqOperations() {
  //LINQ
  //Language Integrated Query
  //Functional Collections
  var numbers = [3, 7, 1, 2, 0, 9, 4, 5, 8, 6];

  //restriction operator

  //where eg 1
  var results = numbers.where((n) => n > 5);
  results.forEach(print);

  var whereResult = customers.where((c) => c.age > 20 || c.id < 5);
  whereResult.forEach(print);

  //Projection Operators(Select)

  var projResult = customers
      .where((c) => c.age < 20)
      .map((c) => {"name": c.customerName, "age": c.age});
  projResult.forEach(
      (c) => print("My name is ${c['name']}, and my age is ${c['age']}"));

  //Projection Operator ( Select many - Compound)
  var projResult2 = customers
      .where((c) => c.id > 5)
      .expand((cu) => cu.Orders)
      .map((o) => {"id": o.orderID, "total": o.orderTotal});

  projResult2.forEach(print);

  var projResult3 = customers
      .expand((c) => c.Orders.where((o) => o.orderTotal > 2000).map((o) =>
          {"name": c.customerName, "total": o.orderTotal, "date": o.orderDate}))
      .take(3);

  projResult3.forEach(print);

  //Partitioning Operators

  var projResult4 = customers.expand((c) => c.Orders
      .where((o) => o.orderTotal > 2000)
      .map((o) => o.orderTotal)
      .takeWhile((t) => t > 4000));

  projResult4.forEach(print);

  //Element Operators
  var projResult5 = customers
      .expand((c) => c.Orders.where((o) => o.orderTotal > 2000).map((o) =>
          {"name": c.customerName, "total": o.orderTotal, "date": o.orderDate}))
      .elementAt(3);

  print(projResult5);
  //Set Operators
  var numbers2 = [1, 1, 2, 2, 3, 3, 3];
  var numbers3 = [1, 4, 2, 5, 7, 8, 9];
  var res1 = numbers2.toSet().intersection(numbers3.toSet());
  res1.forEach(print);
}
