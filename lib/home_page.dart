import 'package:flutter/material.dart';
import 'package:forage/add_forage.dart';
import 'package:forage/forage_details.dart';
import 'package:forage/providers/forage_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forage'),
      ),
      body: ListView.builder(
        itemCount: context.watch<ForageProvider>().getForageList.length,
        itemBuilder: (BuildContext context, int index) {
          return itemForageList(context, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navegar a pag AddForage
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddForage()),
          );
        },
      ),
    );
  }

  Widget itemForageList(BuildContext context, int index) {
    return ListTile(
      title: Text(context.watch<ForageProvider>().getForageList[index]!.name),
      subtitle: Text(
        context.watch<ForageProvider>().getForageList[index]!.location,
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ForageDetails(itemIndex: index),
          ),
        );
      },
    );
  }
}
