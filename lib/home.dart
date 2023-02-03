import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _nmbrController = TextEditingController();

  Box? _nameBox;

  @override
  void initState() {
    _nameBox = Hive.box('name-box');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 50,
          left: 50,
          right: 50,
        ),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
            ),
            TextField(
              controller: _nmbrController,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    final nameInput = _nameController.text;
                    //final nmbrInput= _nmbrController.text;
                    _nameController.clear();
                    await _nameBox!.add(nameInput);
                  } catch (e) {}
                },
                child: Text('Add Name')),
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: Hive.box('name-box').listenable(),
                  builder: (context, box, Widget) {
                    return ListView.builder(
                        itemCount: _nameBox?.keys.length,
                        itemBuilder: (_, index) {
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              trailing: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.delete))
                                ],
                              ),
                              title: Text(
                                _nameBox!.getAt(index).toString(),
                              ),
                            ),
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
