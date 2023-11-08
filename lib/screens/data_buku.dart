import 'package:flutter/material.dart';
import 'package:libshop_mobile/main.dart';
import 'package:libshop_mobile/screens/shoplist_form.dart';
import 'package:libshop_mobile/widgets/left_drawer.dart';
import 'package:libshop_mobile/widgets/globals.dart' as globals;

class DataBukuPage extends StatefulWidget {
  const DataBukuPage({super.key});

  @override
  State<DataBukuPage> createState() => _DataBukuState();
}

class _DataBukuState extends State<DataBukuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Buku'),
      ),
      drawer: const LeftDrawer(),
      body: Center(
          child: ListView.builder(
            itemCount: globals.semuaBuku.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(5.0),
                    shadowColor: Colors.blueGrey,
                    child: ListTile(
                      title: Text(globals.semuaBuku[index].name),
                      subtitle: Text(globals.semuaBuku[index].description),
                      trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Jumlah : ${globals.semuaBuku[index].amount}")
                          ]),
                    )),
              );
            }),
          )),
    );
  }
}