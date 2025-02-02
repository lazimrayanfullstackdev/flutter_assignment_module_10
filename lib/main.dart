import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget{
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _HomeState();
}

class _HomeState extends State<Myapp>{
  List<String> nameList = [];
  List<dynamic> numberList = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  _addName(String name){
    setState(() {
      nameList.add(name);
      nameController.clear();
    });
  }

  _addNumber(dynamic number){
    setState(() {
      numberList.add(number);
      numberController.clear();
    });
  }

  _removeitem(int index){
    setState(() {
      nameList.removeAt(index);
      numberList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact List", style: TextStyle(fontSize: 25, color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                    label: Text("Name")
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: numberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Number",
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                        _addName(nameController.text);
                        _addNumber(numberController.text);
                    }, child: Text("Add"),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
    ),
    )
                    )
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                      itemCount: nameList.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: Text(nameList[index]),
                          subtitle: Text(numberList[index]),
                          leading: Icon(Icons.person, color: Colors.brown,),
                          trailing: Icon(Icons.phone),
                        );
                      }),
                )
              ],
            )
        ),
      ),
    );
  }
}