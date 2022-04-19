import 'package:flutter/material.dart';
import 'package:lagerverwaltung/domains/Lager.dart';
import 'package:lagerverwaltung/pages/LieferungPage.dart';

class GridViewChild extends StatefulWidget {
  Lager lager;
  GridViewChild(this.lager,{Key? key}) : super(key: key);

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
                child: Text(widget.lager.location,textAlign: TextAlign.center,),
                width: 150,
              ),
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: LinearProgressIndicator(
                        value: widget.lager.fuellstand/widget.lager.kapazitaet,
                      ),
                    ),
                    Text(((widget.lager.fuellstand/widget.lager.kapazitaet)*100).toString()+'%',style: TextStyle(),textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => LieferungPage(widget.lager)));
        },
      ),

    );
  }
}
