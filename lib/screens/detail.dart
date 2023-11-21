import 'package:flutter/material.dart';
import 'package:libshop_mobile/models/item.dart'; // Import your Item model

class ItemDetailPage extends StatelessWidget {
  final Item item;

  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name), // Accessing name via fields object
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${item.fields.name}"),
            Text("Amount: ${item.fields.amount}"),
            Text("Description: ${item.fields.description}"),
            Text("Price: ${item.fields.price}"),
            Text("Genre: ${item.fields.genre}"),
            
          ],
        ),
      ),
    );
  }
}