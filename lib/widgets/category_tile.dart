import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../category_news.dart';

class CategoryTile extends StatelessWidget {

  final imageUrl, categoryName;
  CategoryTile(this.imageUrl, this.categoryName);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryView(
                category: categoryName.toLowerCase()
            )
        )
        );
      },
      child: Container(
          child: Stack(
              children: <Widget> [
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child:Image.network(imageUrl, width: 120, height: 60, fit: BoxFit.cover)
                ),
                Center(
                  child: Container(
                      child: Text(categoryName, style: TextStyle(
                          color: Colors.white
                      ))
                  ),
                )
              ]
          )
      ),
    );
  }
}