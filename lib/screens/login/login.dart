import 'package:flutter/material.dart';
import 'package:work_order_process/screens/scrap/scrap_screen.dart';
import 'package:work_order_process/screens/work_order/work_order.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: Container(
        width: double.infinity,
        child: Drawer(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScrapScreen()),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Scrap',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Heading 2',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Heading 3',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
            height: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Text(
                    'Login to access OMS',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    constraints: BoxConstraints(maxWidth: 500),
                    child: Expanded(
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: usernameController,
                                    decoration: const InputDecoration(
                                      icon: Icon(Icons.person),
                                      hintText:
                                          'What username do you use for OMS?',
                                      labelText: 'Username *',
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    controller: passwordController,
                                    //keyboardType: TextInputType.visiblePassword,
                                    decoration: const InputDecoration(
                                      icon: Icon(Icons.lock),
                                      hintText: 'Your password for OMS?',
                                      labelText: 'Password *',
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue[800]),
                                      ),
                                      onPressed: () {
                                        String user = "test1234";
                                        String password = "test1234";
                                        // Validate returns true if the form is valid, otherwise false.
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                          debugPrint(
                                              '${usernameController.text} ${passwordController.text}');
                                          // Scaffold.of(context).showSnackBar(
                                          //     SnackBar(content: Text('Processing Data')));
                                          if (usernameController.text == user &&
                                              passwordController.text ==
                                                  password) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      WorkOrderPage()),
                                            );
                                          }
                                        }
                                      },
                                      child: Text('Login'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                      'Place finger for biometric authentication'),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Icon(
                                      Icons.fingerprint,
                                      size: 100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
