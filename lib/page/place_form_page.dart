import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greatplaces/components/image_input.dart';
import 'package:greatplaces/provider/grate_places.dart';
import 'package:provider/provider.dart';

class PlaceFormPage extends StatefulWidget {
  const PlaceFormPage({Key? key}) : super(key: key);

  @override
  State<PlaceFormPage> createState() => _PlaceFormPageState();
}

class _PlaceFormPageState extends State<PlaceFormPage> {
  final _titleController = TextEditingController();
  File? _pikedImage;

  void _selectImage(File pikedImage) {
    _pikedImage = pikedImage;
  }

  void _submitForm() {
    if (_titleController.text.isEmpty || _pikedImage == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      _titleController.text,
      _pikedImage!,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Lugar'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Titulo',
                      ),
                    ),
                    SizedBox(height: 10),
                    ImageInput(this._selectImage)
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(
              Icons.add,
              color: Colors.green,
              size: 30.0,
            ),
            label: Text("Adicionar"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              primary: Color.fromARGB(255, 92, 51, 37),
              textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            onPressed: _submitForm,
          ),
        ],
      ),
    );
  }
}
