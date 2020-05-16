import 'package:flutter/material.dart';
class SpecialPick extends StatefulWidget {
  @override
  _SpecialPickState createState() => _SpecialPickState();
}

class _SpecialPickState extends State<SpecialPick> {
  
  final _formKey =GlobalKey<FormState>();
 //text field state

 String email ='';
 String password='';
 String error='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
 body: Form(
           
          key: _formKey,
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    
                     child:Image(
          
          image: AssetImage('assets/images/logo.jpg'),
          //image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/a/ab/Android_O_Preview_Logo.png'),
  )
                    
                    ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Special PickUp',
                      style: TextStyle(fontSize: 28,color:Colors.green),
                    )
                    ),


              Container(
                  padding: EdgeInsets.all(10),

          
                  child: TextFormField(
                    //controller: nameController,
                    decoration: InputDecoration(
                    
                    enabledBorder: const OutlineInputBorder(
                       
        //borderRadius: BorderRadius.circular(2),
         borderSide: BorderSide(width: 2, color: Colors.green)
                       
                      ),
                      
                      labelText: 'Name',
                     
                      
                    ),
                    // onChanged: (val){
                      
                    //   setState(()=>email=val);


                    // },
                    // validator: (val)=> val.isEmpty ? 'Enter the name':null,

                  ),
                
                ),


  Container(
                  padding: EdgeInsets.all(10),


          
                  child: TextFormField(
                    //controller: nameController,
                    decoration: InputDecoration(
                    
                    enabledBorder: const OutlineInputBorder(
                       
        //borderRadius: BorderRadius.circular(2),
         borderSide: BorderSide(width: 2, color: Colors.green)
                       
                      ),
                      
                      labelText: 'Address',
                      
                     
                      
                    ),
                   // obscureText:true,
                    // onChanged: (val){
                    // setState(()=>password=val);
                    // },

                    //  validator: (val)=> val.isEmpty ? 'Enter the address':null,
                  ),
                
                ),
            // 


 Container(
                  padding: EdgeInsets.all(10),

          
                  child: TextFormField(
                    //controller: nameController,
                    decoration: InputDecoration(
                    
                    enabledBorder: const OutlineInputBorder(
                       
        //borderRadius: BorderRadius.circular(2),
         borderSide: BorderSide(width: 2, color: Colors.green)
                       
                      ),
                      
                      labelText: 'Email',
                     
                      
                    ),
                  //   onChanged: (val){
                      
                  //     setState(()=>email=val);


                  //   },
                  //   validator: (val)=> val.isEmpty ? 'Enter an Email':null,

                  ),
                
                ),


 Container(
                  padding: EdgeInsets.all(10),

          
                  child: TextFormField(
                    //controller: nameController,
                    decoration: InputDecoration(
                    
                    enabledBorder: const OutlineInputBorder(
                       
        //borderRadius: BorderRadius.circular(2),
         borderSide: BorderSide(width: 2, color: Colors.green)
                       
                      ),
                      
                      labelText: 'Email',
                     
                      
                    ),
                    // onChanged: (val){
                      
                    //   setState(()=>email=val);


                    // },
                    // validator: (val)=> val.isEmpty ? 'Enter an Email':null,

                  ),
                
                ),






//submit button

             Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text('Login'),
                      onPressed: () 
                      {
                          

                       
                          // if(_formKey.currentState.validate()){

                            
                        //  print(email);
                        // print(password);
                      
                            Navigator.of(context).pushNamed('/addGarbageList');
                             
                          
                          
                          // }





                      },
            
                    )),
              ],
 ),

 ),
    );
  }
}



   
              
 



 

