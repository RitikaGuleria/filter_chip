class Product
{
  final String name;
  final String category;

  Product({required this.name,required this.category});

}

final List<Product> productList = [
  Product(name: "Sandwich", category: 'Food'),
  Product(name: "Fish", category: 'Food'),
  Product(name: "Vegetables", category: 'Food'),
  Product(name: 'Apple', category: 'Fruits'),
  Product(name: 'Mango', category: 'Fruits'),
  Product(name: 'Litchi', category: 'Fruits'),
  Product(name: 'Banana', category: 'Fruits'),
  Product(name: 'Cricket', category: 'Games'),
  Product(name: 'Football', category: 'Games'),
  Product(name: 'Tesla', category: 'Cars'),
  Product(name: 'Audi', category: 'Cars'),
  Product(name: 'BMW', category: 'Cars'),
];