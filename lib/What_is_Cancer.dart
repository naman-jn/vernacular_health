import 'package:flutter/material.dart';

class Cancerit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Common Cancers'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(

        children: <Widget> [
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                child: Text('Bladder Cancer'),
                color: Colors.indigoAccent,
                onPressed: (){},
              ),
              RaisedButton(onPressed:() {},
              child: Text('Lung Cancer'),
                color: Colors.indigoAccent,
              ),
              RaisedButton(onPressed: (){},
              child: Text('Pancreatic Cancer'),
                color: Colors.indigoAccent,
              ),
            ],

          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                child: Text('Breast Cancer'),
                color: Colors.indigoAccent,
                onPressed: (){},
              ),
              RaisedButton(onPressed:() {},
                child: Text('Lymphoma'),
                color: Colors.indigoAccent,
              ),
              RaisedButton(onPressed: (){},
                child: Text('Prostate Cancer'),
                color: Colors.indigoAccent,
              ),
            ],

          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                child: Text('Colorectal Cancer'),
                color: Colors.indigoAccent,
                onPressed: (){},
              ),
              RaisedButton(onPressed:() {},
                child: Text('Melanoma'),
                color: Colors.indigoAccent,
              ),
              RaisedButton(onPressed: (){},
                child: Text('Thyroid Cancer'),
                color: Colors.indigoAccent,
              ),
            ],

          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                child: Text('Kidney Cancer'),
                color: Colors.indigoAccent,
                onPressed: (){},
              ),
              RaisedButton(onPressed:() {},
                child: Text('Oral  Cancer'),
                color: Colors.indigoAccent,
              ),
              RaisedButton(onPressed: (){},
                child: Text('Uterine Cancer'),
                color: Colors.indigoAccent,
              ),
            ],

          ),


        ],

      ),
    );
  }
}
