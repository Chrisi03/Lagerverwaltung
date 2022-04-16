import 'package:flutter/material.dart';

class GridViewChild extends StatefulWidget {
  const GridViewChild({Key? key}) : super(key: key);

  @override
  _GridViewChildState createState() => _GridViewChildState();
}

class _GridViewChildState extends State<GridViewChild> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Container(
                child: Text('Wien'),
                width: 300,
              ),
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: LinearProgressIndicator(
                        value: 0.7,
                      ),
                    ),
                    Text('Test',style: TextStyle(),textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
      footer: GridTileBar(
        //backgroundColor: Colors.black45,
        title: Text('title'),
      ),
    );
  }
}
