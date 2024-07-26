import 'package:api_app/network/getdataproduct.dart';
import 'package:flutter/material.dart';
import 'package:api_app/models/product_model.dart';


class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<Products> _products;

  @override
  void initState() {
    super.initState();
    _products = GetDataProduct().getAnswer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: FutureBuilder<Products>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.data.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          final products = snapshot.data!.data; 

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                title: Text(product.nombre), 
                subtitle: Text('Precio: ${product.precio}'), 
              );
            },
          );
        },
      ),
    );
  }
}
