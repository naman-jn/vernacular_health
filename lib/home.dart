import 'package:flutter/material.dart';
import 'package:vernacular_health/What_is_Cancer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('புற்றுநோய்',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
      ),
      body:Column(

        children:<Widget> [
          SizedBox(
            height: 10.0,
          ),
          InkWell(
            onTap: (){},
            child: Container( 
              padding: EdgeInsets.all(7),
              height: 150.0,
              width: 400.0,
              decoration: BoxDecoration(

                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.indigo[700],
                      Colors.indigo[200]
                    ],
                  )

              ),
              child: Center(child: Text('புற்றுநோய் என்றால் என்ன')),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          InkWell(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.all(7),
              height: 150.0,
              width: 400.0,
              decoration: BoxDecoration(

                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.indigo[700],
                      Colors.indigo[200]
                    ],
                  )

              ),
              child: Center(child: Text('புற்றுநோய் A-Z')),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          InkWell(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.all(7),
              height: 150.0,
              width: 400.0,
              decoration: BoxDecoration(

                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.indigo[700],
                      Colors.indigo[200]
                    ],
                  )

              ),
              child: Center(child: Text('செய்தி அறை')),
            ),
          ),



        ],
      ),

    );
  }
}
