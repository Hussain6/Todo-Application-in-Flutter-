import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> lst = [1, 2, 3];
  var item = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Todo Application"),
      ),
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
                height: 50,
                color: Colors.orange,
                margin: EdgeInsets.only(top: 15),
                child: ListTile(
                  title: Text("${lst[index]}"),
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Edit Item"),
                                      content: TextField(
                                        onChanged: (value) {
                                          item = value;
                                        },
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              setState(() {
                                                lst.replaceRange(
                                                    index, index + 1, {item});
                                              });
                                            },
                                            child: Text("Edit"))
                                      ],
                                    );
                                  });
                            },
                            child: Icon(Icons.edit)),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                lst.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Item"),
                  content: TextField(
                    onChanged: (value) {
                      item = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            lst.add(item);
                          });
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },
        backgroundColor: Colors.black,
        child: Text("Add"),
      ),
    );
  }
}
