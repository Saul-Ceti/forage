import 'package:flutter/material.dart';
import 'package:forage/providers/forage_provider.dart';
import 'package:provider/provider.dart';

class AddForage extends StatelessWidget {
  AddForage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar nuevo forraje'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 24),
            TextField(
              controller: context.read<ForageProvider>().nameCont,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nombre",
              ),
            ),
            SizedBox(height: 24),
            TextField(
              controller: context.read<ForageProvider>().locationCont,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Ubicación",
              ),
            ),
            SizedBox(height: 24),
            ListTile(
              leading: Checkbox(
                value: context.watch<ForageProvider>().getIsInSeason,
                onChanged: (newVal) {
                  context.read<ForageProvider>().setCurrentlyInSeason(newVal);
                },
              ),
              title: Text("Actualmente en temporada?"),
            ),
            SizedBox(height: 24),
            TextField(
              controller: context.read<ForageProvider>().detailsCont,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Detalles",
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.purple,
                  textColor: Colors.white,
                  child: Text("Guardar"),
                  onPressed: () {
                    if (_validateFields(context)) {
                      context.read<ForageProvider>().saveNewForage();
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Por favor, complete todos los campos.'),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(width: 16),
                MaterialButton(
                  color: Colors.purple,
                  textColor: Colors.white,
                  child: Text("Limpiar"),
                  onPressed: () {
                    context.read<ForageProvider>().clearNewForage();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _validateFields(BuildContext context) {
    final forageProvider = context.read<ForageProvider>();

    // Validar si los campos están vacíos
    if (forageProvider.nameCont.text.isEmpty ||
        forageProvider.locationCont.text.isEmpty ||
        forageProvider.detailsCont.text.isEmpty) {
      return false;
    }

    return true;
  }
}