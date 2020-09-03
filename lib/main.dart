import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Siform(),
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.indigo,
          accentColor: Colors.transparent),
    ));

class Siform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SiSFormState();
  }
}

class _SiSFormState extends State<Siform> {
  var _farmKey = GlobalKey<FormState>();
  var currencies = ['Rupees', 'Dollars', 'Pounds'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Form(
          key: _farmKey,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                getImageAssets(),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Principal',
                      hintText: 'Enter Principal e.g 10000',
                      errorStyle: TextStyle(color: Colors.yellowAccent,fontSize: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter Principal Amount';
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Rate of Interset',
                      hintText: 'In Percentage',
                      errorStyle: TextStyle(color: Colors.yellowAccent,fontSize: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter Interset';
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Term',
                          hintText: 'In year',
                          errorStyle: TextStyle(color: Colors.yellowAccent,fontSize: 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter term';
                            }
                          },
                    )),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                        child: DropdownButton<String>(
                      items: currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: 'Rupees',
                      onChanged: (String newValueSelected) {},
                    ))
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      child: Text('Calculate'),
                      color: Colors.indigo,
                      onPressed: () {
                        setState(() {
                          if (_farmKey.currentState.validate()) {}
                        });
                      },
                    )),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                        child: RaisedButton(
                      child: Text('Reset'),
                      color: Colors.transparent,
                      onPressed: () {},
                    ))
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Todo Text')
              ],
            ),
          )),
    );
  }

  Widget getImageAssets() {
    AssetImage assetImage = AssetImage('images/money.png');
    Image image = Image(
      image: assetImage,
      width: 150.0,
      height: 150.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(50.0),
    );
  }
}
