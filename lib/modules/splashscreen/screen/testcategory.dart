import 'package:flutter/material.dart';
import 'package:yoga/core/data/database.dart';
import 'package:yoga/models/catagory.dart';

class TestCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseProvider.db.getCategoryByType("popular"),
      builder: (BuildContext context,
          AsyncSnapshot<List<Category>> responseListCategory) {
        if (responseListCategory.hasData) {
          return ListView.builder(
              itemCount: responseListCategory.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text(responseListCategory.data![index].name.toString()),
                );
              });
        } else {
          return CircularProgressIndicator(
            backgroundColor: Colors.amber,
          );
        }
      },
    );
  }
}
