import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagerverwaltung/provider/Lagern.dart';
import 'package:provider/provider.dart';

class AddLager extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _kapazitaetController = new TextEditingController();
  final TextEditingController _locationController = new TextEditingController();
  AddLager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lagern = Provider.of<Lagern>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Neues Lager'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _kapazitaetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Kapazitaet'),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            FloatingActionButton(onPressed: () {
              if(_formKey.currentState!.validate()){
                lagern.addLager(int.parse(_kapazitaetController.text), _locationController.text);
                _kapazitaetController.clear();
                _locationController.clear();
                Navigator.pop(context);
              }
            },child: Icon(Icons.add),)
          ],
        ),
      ),
    );
  }
}
