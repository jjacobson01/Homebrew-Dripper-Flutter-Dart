import 'package:flutter/material.dart';
import 'recipe_selection_screen.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(
          flex: 1,
        ),
        Container(
          child: Center(
              child: Text(
            "enjoy your amazing \n handmade coffee",
            key: Key('doneScreen'),
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: new Color(0xFF4C748B),
              fontSize: 18,
              fontFamily: 'Montserrat',
            ),
          )),
        ),
        Spacer(flex: 1),
        Container(
          child: Center(
            child: FlatButton(
              key: Key('donebtn'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeSelectionScreen()),
                );
              },
              color: Colors.transparent,
              child: Text(
                "done",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: new Color(0xFF4C748B),
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        ),
        Divider(
          height: 50,
        ),
      ],
    ));
  }
}
