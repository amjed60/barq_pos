import 'package:flutter/material.dart';

import 'package:chaquopy/chaquopy.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(' Namp '),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;
  late TextEditingController _controller2;
  late TextEditingController _controller3;
  

  String _outputOrError = "", _error = "";

  Map<String, dynamic> data = Map();
  bool loadImageVisibility = true;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    
    super.initState();
  }

  @override
  void dispose() {
    
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      minimum: EdgeInsets.only(top: 4),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    
                    child: TextFormField(
                          decoration: InputDecoration(
          labelText: "number 1 ",
          fillColor: Colors.white,
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      controller: _controller,   
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    
                    child: TextFormField(
                          decoration: InputDecoration(
          labelText: "number 2 ",
          fillColor: Colors.white,
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
                      keyboardType: TextInputType.number,
                      controller: _controller2,   
                    ),
                  ),
                  SizedBox(width: 10,),

                  Expanded(
                    
                    child: TextFormField(
                     decoration: InputDecoration(
          labelText: "number 3 ",
          fillColor: Colors.white,
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
                      keyboardType: TextInputType.number,
                      controller: _controller3,   
                    ),
                  ),
                ],
              ),
                  SizedBox(height: 100,),

              Expanded(
                flex: 2,
                child: Container(
                  child: Text(
                    'This shows Output Or Error :\n\n $_outputOrError',
                  ),
                ),
              ),
              Row(
                children: [
                
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        height: 50,
                        color: Colors.blue,
                        child: Text(
                          'run Code',
                        ),
                        onPressed: () async {
                         String code="""
import numpy as np
random = np.random.randint(${_controller.text}, ${_controller2.text}, ${_controller3.text})
print(random)
""";
                          final _result =
                              await Chaquopy.executeCode(code);
                          setState(() {
                            _outputOrError = _result['textOutputOrError'] ?? '';
                          });
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}