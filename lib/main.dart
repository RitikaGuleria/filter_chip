import 'package:filter_chip/model/product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Filter Chip",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.indigo),
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  final List<String> categories = ['Food','Fruits','Games','Cars'];
  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {

    final filterProducts = productList.where((product) {
      return selectedCategories.isEmpty || selectedCategories.contains(product.category);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Chip Record"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: categories.map((category) => FilterChip(label: Text(category),
                    selected: selectedCategories.contains(category),
                    onSelected: (selected){
                      setState(() {
                        if(selected)
                        {
                          selectedCategories.add(category);
                        }else{
                          selectedCategories.remove(category);
                        }
                      });
            })).toList()),
          ),
          Expanded(
            child: ListView.builder(itemCount: filterProducts.length,itemBuilder: (context,index){
              final product = filterProducts[index];
              return Card(elevation: 8.0,margin: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.indigoAccent),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal:10,vertical: 10),
                  title:  Text(product.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  subtitle: Text(product.category,style: TextStyle(color: Colors.white),),
                ),
              ),
              );
            }),
          ),
        ],
      )
    );
  }
}
