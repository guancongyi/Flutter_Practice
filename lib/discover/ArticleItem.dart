import 'package:flutter/material.dart';
import 'Article.dart';

// 不用背，学规律
class ArticleItem extends StatelessWidget {
  final Article model;
  ArticleItem(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(model.logo),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Container(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: Text(
                            model.location,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                    SizedBox(width: 7),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('|' + model.type),
                        Text('|' + model.size),
                        Text('|' + model.count),
                      ],
                    )
                  ],
                ),
                Divider(),
                Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(model.hot,
                            style: TextStyle(fontSize: 15, color: Colors.grey)),
                        Text(
                          '>',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}
