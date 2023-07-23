import 'package:flutter/material.dart';
// '../mixins/validationmixin.dart';
class LoginScreen extends StatefulWidget{
 
 createState(){
  return LoginScreenState();
 }
}
mixin class  ValidationMixin{


String? ValidatingEmail (String? value){
          if(!value!.contains('@')){
            return 'Please enter a valid email address';
          }
          return null;

          
       } 


String? ValidatingPassword(String ?value){
        if(value!.length<4){
            return 'Password must be at least 4 characters';
        }
        return null;
      } 

}

class LoginScreenState extends State<LoginScreen> with ValidationMixin  {
 
  final formkey=GlobalKey<FormState>( );
  String email='';
  String password='';

  Widget build(context){
     
    
    return Container(
      margin: EdgeInsets.all(20.0),
      child : Form(
        key: formkey,
          child: Column(
            children: [
              emailField(),
              Container(margin:EdgeInsets.only(top: 25.0)),
              passwordfield(),
              Container(margin:EdgeInsets.only(top: 25.0)),
              SubmitButton(),
            ],
          ),
      ),
    );
  }

  //helper methon
  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: 'Email Address',
          hintText: "your@example.com",
        ),
      /* validator: (String? value){
          if(!value!.contains('@')){
            return 'Please enter a valid email address';
          }
          return null;

          
       },*/
       validator: ValidatingEmail,
      
      
      onSaved:(String ? value){
        email=value!;
      },
    );
  }
  Widget passwordfield(){
    /*return Container(
      margin: EdgeInsets.all(20.0),
      child:TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
      labelText: 'Password',
      hintText: 'Password',

      ),  //one way to change margin  for submit button
        // not a good way to do it

    ), 
    );*/
    
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
      labelText: 'Password',
      hintText: 'Password',

      ),
     /* validator:(String ?value){
        if(value!.length<4){
            return 'Password must be at least 4 characters';
        }
        return null;
      } ,*/
      validator: ValidatingPassword,
   
         onSaved: (String ?value){
        password=value!;
      },
    );

  }
Widget SubmitButton(){
        return ElevatedButton(
           /* style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
            ),*/ //this  is the way to change colors
          child: Text('Submit'),
          onPressed: () { 
          
          if (formkey.currentState!.validate()){
            formkey.currentState!.save();
           // print('time to post  $email and $password to my API ');
          }

           },

//both email and password amd then send to api
        );
       }
}


 