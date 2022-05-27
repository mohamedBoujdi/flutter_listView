import 'package:flutterapp5/user.dart';
import 'package:flutter/material.dart';
import 'package:glass_card/glass_card.dart';

class DetailPage extends StatelessWidget {
  final User user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
    child: CardGlass(
    height: 300,
    width: 300,
    //borderRadius: BorderRadius.all(Radius.circular(150)),
        child: Center(
          child: Container(
            decoration: ShapeDecoration(color: Colors.transparent, shape:Border.all(
              color: Colors.transparent,
              width: 8.0,
            ) + Border.all(
              color: Colors.transparent,
              width: 8.0,
            ) + Border.all(
              color: Colors.transparent,
              width: 8.0,
            ),
            ),
            child: Column(
              children: [
                SizedBox(height: 60,),
                CircleAvatar(backgroundColor: Colors.deepOrange,
                  child: Image(
                    image: NetworkImage(user.picLarge),
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(height: 40,),
                Text(user.name,
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                Text(user.phone,
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                Text(user.email,
                  style: TextStyle(
                      fontSize: 15
                  ),
                )
              ],
            ),
          ),
        ),
    ),
      ),
    );
  }
}
