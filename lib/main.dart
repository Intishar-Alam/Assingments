import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey[300],
        appBarTheme: AppBarTheme(
            color: Colors.blueGrey[300],
            foregroundColor: Colors.white,
            titleTextStyle: TextStyle(fontSize: 26)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[300],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)))),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, String> contacts = {};
  TextEditingController _Namecontroller = TextEditingController();

  TextEditingController _Numbercontroller = TextEditingController();

  AddingListtile() {
    setState(() {
      if (_Namecontroller.text.isNotEmpty &&
          _Numbercontroller.text.isNotEmpty) {
        contacts[_Namecontroller.text] = _Numbercontroller.text;
      }
      _Namecontroller.clear();
      _Numbercontroller.clear();
    });
  }
  
  alertbox(int index){
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("Confirmation",style: TextStyle(fontWeight: FontWeight.bold),),
          content: Text("Are you sure for delete ?"),
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).pop();
            }, icon: Icon(Icons.cancel_presentation_sharp,color: Colors.blue,)),

            IconButton(onPressed: (){
              setState(() {
                contacts.remove(contacts.keys.elementAt(index));
              });
              Navigator.of(context).pop();
            }, icon: Icon(Icons.delete_outline_outlined,color: Colors.blue,)),

          ],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),

        )
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              children: [
                TextField(
                  keyboardType: TextInputType.name,
                  controller: _Namecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _Numbercontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: AddingListtile, child: Text("Add")),
                )
              ],
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),

                        child: ListTile(
                          onLongPress: ()=> alertbox(index),

                          minTileHeight: 20,
                          title: Text(
                            "${contacts.keys.elementAt(index)}",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          subtitle: Text("${contacts.values.elementAt(index)}"),
                          leading: Icon(
                            Icons.person,
                            color: Colors.brown,
                            size: 35,
                          ),
                          trailing: Icon(
                            Icons.call,
                            color: Colors.blue,
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
