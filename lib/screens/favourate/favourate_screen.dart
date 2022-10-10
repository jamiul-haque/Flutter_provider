import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerr/provider/favourate_provider.dart';

import 'my_favourate.dart';

class FavourateScreen extends StatefulWidget {
  const FavourateScreen({Key? key}) : super(key: key);

  @override
  State<FavourateScreen> createState() => _FavourateScreen();
}

class _FavourateScreen extends State<FavourateScreen> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    // final favouriteProvider = Provider.of<FavourateItlemProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourate'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>const MyFavourate()));
            },
            child:const Icon(Icons.favorite),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Consumer<FavourateItlemProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text('Item $index'),
                      trailing: Icon(
                        value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: Colors.amber,
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
