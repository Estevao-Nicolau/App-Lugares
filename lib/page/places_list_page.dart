import 'package:flutter/material.dart';
import 'package:greatplaces/provider/grate_places.dart';
import 'package:greatplaces/routes/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Lugares'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
          child: Center(
            child: Text('Nenhum local cadastrado!'),
          ),
          builder: (context, greatPlaces, ch) => greatPlaces.itemsCount == 0
              ? ch!
              : ListView.builder(
                  itemCount: greatPlaces.itemsCount,
                  itemBuilder: (ctx, i) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          FileImage(greatPlaces.itemByIndex(i).image),
                    ),
                    title: Text(greatPlaces.itemByIndex(i).title),
                    onTap: () {},
                  ),
                )),
    );
  }
}
