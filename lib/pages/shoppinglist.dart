import 'package:flutter/material.dart';


// ignore: must_be_immutable
class GroceryList extends StatefulWidget {
  GroceryList({Key? key}) : super(key: key);

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<String> groceries = ['Chicken', 'Rice', 'Seasoning'];
  //List<double> prices = [7.23, 5.01, 2.56];

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Optional: Adjust the content padding
                    hintText: 'Ex: Ingredient',
                    border: InputBorder.none, // Hide the default border of the TextField
                  ),
                  cursorColor: Colors.brown.shade200,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            ElevatedButton(
              child: Icon(Icons.add, color: Colors.brown.shade200),
              onPressed: () { 
                setState(() {
                  groceries.add(textController.text);
                  textController.clear();
                });
              },
            ),
          ],
        )
      ),
      body: ListView.builder(
        itemCount: groceries.length,
        itemBuilder: (BuildContext context, int index) { 
          return Card(child: ListTile(
            tileColor: Colors.brown.shade100,
            title: Text(groceries[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () { 
                setState(() {
                  groceries.removeAt(index);
                });
              },
            ),
            )
          );
        },
      )

    );
  }
}