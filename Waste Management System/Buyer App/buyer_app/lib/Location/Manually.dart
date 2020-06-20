import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Manually extends StatefulWidget {
  @override
  _ManuallyState createState() => _ManuallyState();
}

class _ManuallyState extends State<Manually> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mannual Location'),
        backgroundColor: Colors.green,),
      body: SignForm(),
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Container(
              alignment: Alignment.center,
              child: Text(''),
            ),

            Container(
              alignment: Alignment.center,
            ),

            //location seen

            Container(
              padding: EdgeInsets.all(10),
              child:
              TextFormField(
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.add_location,color: Colors.black),
                  hintText: 'Enter your location',
                  labelText: 'Location',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

                ),
                controller: locationController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
              ),
            ),

            //  terms and conditions...
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  FlatButton(
                    padding: const EdgeInsets.only(right: 120.0),


                    textColor: Colors.green,
                    child: Text('Our terms & conditions'
                    ),

                    onPressed: () {
                      //terms and condition page
                      Navigator.of(context).pushNamed('/terms');
                    },
                  ),
                  FormBuilderCheckbox(
                    initialValue: false,
                    label: Text(
                      "I have read and agree to the terms and conditions",
                      style: TextStyle(color: Colors.black87),),
                    validators: [
                      FormBuilderValidators.requiredTrue(
                        errorText:
                        "You must accept terms and conditions to continue",
                      ),
                    ],
                  ),

                ],
              ),
            ),

            new Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      child: const Text('BACK'),
                      color: Colors.yellow,
                      textColor: Colors.black,

                      onPressed: (){
                        Navigator.of(context).pushNamed('/login');
                      },
                    ),

                    RaisedButton(
                      child: const Text('SIGN UP'),
                      color: Colors.green,
                      textColor: Colors.white,

                      onPressed: () {

                        if (_formKey.currentState.validate()) {

                          print(locationController.text);


                          Navigator.of(context).pushNamed('/buyerhome');

//                        Scaffold
//                            .of(context)
//                            .showSnackBar(SnackBar(content: Text('Sending Data'),backgroundColor: Colors.green,));

                        }
                      },
                    ),

                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )

            ),
          ],
        ),
      ),
    );
  }
}
