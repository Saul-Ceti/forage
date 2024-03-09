import 'package:flutter/material.dart';
import 'package:forage/providers/forage_provider.dart';
import 'package:provider/provider.dart';

class ForageDetails extends StatelessWidget {
  final int itemIndex;
  ForageDetails({super.key, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forage details"),
      ),
      body: ListView(
        children: [
          Text(
            context.read<ForageProvider>().getForageList[itemIndex]!.name,
            style: TextStyle(fontSize: 24),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.place),
            title: Text(
              context
                .read<ForageProvider>()
                .getForageList[itemIndex]!
                .location
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text(
              context
                .read<ForageProvider>()
                .getForageList[itemIndex]!
                .inSeason
                .toString(),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notes),
            title: Text(
              context
                .read<ForageProvider>()
                .getForageList[itemIndex]!
                .details,
            ),
          ),
        ],
      ),
    );
  }
}
