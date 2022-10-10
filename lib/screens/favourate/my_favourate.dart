import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/favourate_provider.dart';

class MyFavourate extends StatefulWidget {
  const MyFavourate({Key? key}) : super(key: key);

  @override
  State<MyFavourate> createState() => _MyFavourateState();
}

class _MyFavourateState extends State<MyFavourate> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavourateItlemProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourate'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyFavourate()));
            },
            child: const Icon(Icons.favorite),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favouriteProvider.selectedItem.length,
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
