import 'package:apiflutterlogin/controllers/crud.dart';
import 'package:flutter/material.dart';

import '../main.dart';
 
 class  AgregarProducto extends StatefulWidget {
   //le pasamos como parametro como lo es el key
   AgregarProducto({Key key, this.title}): super(key : key);
   final title;
   @override
   _AgregarProductoState createState() => _AgregarProductoState();
 }
 
 class _AgregarProductoState extends State<AgregarProducto> {
   //instanciamos nuestro controlador que es el crud
   Crud crud= new  Crud();

   final TextEditingController _nombreController = new TextEditingController();
   final TextEditingController _precioController = new TextEditingController();
   final TextEditingController _stockController = new TextEditingController();

   @override
   Widget build(BuildContext context) {
       return MaterialApp(
           debugShowCheckedModeBanner: false,
         title: 'Agregar prdoducto',

         home: Scaffold(
           
            appBar: AppBar(
              
              title: Text('Agregar producto'),
            ),
            body: Container(
              child: ListView(
                padding: const EdgeInsets.only(top: 62, left:12.0, right: 12.0, bottom:12.0),
                children: <Widget>[
                  //---nombre del producto
                  Container(
                    height: 50,
                    child: new TextField(
                      controller: _nombreController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'nombre del producto',
                        hintText: 'nombre del producto',
                        icon: new Icon(Icons.email),
                      ),
                    )
                  ),
                   //n
                 Container(
                    height: 50,
                    child: new TextField(
                      controller: _precioController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'precio del producto',
                        hintText: 'precio del producto',
                        icon: new Icon(Icons.account_circle),
                      ),
                    )
                  ),
                
                 new Padding(padding: new EdgeInsets.only(top: 44.0),),

                 Container(
                    height: 50,
                    child: new TextField(
                      controller: _stockController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'stock',
                        hintText: 'stock',
                        icon: new Icon(Icons.apps),
                      ),
                    )
                  ),
                
                new Padding(padding: new EdgeInsets.only(top: 44.0),),
                //boton
                Container(
                  height: 50,
                  child: new RaisedButton(
                    onPressed: (){
                      crud.agregarProducto(_nombreController.text.trim()
                      , _precioController.text.trim(), _stockController.text.trim());
                         Navigator.of(context).push(
                           new MaterialPageRoute(
                             builder: (BuildContext context) => new MainPage(),
                           )
                         );  
                    },

                    color: Colors.blue,
                      child: new Text(
                         'Guardar',
                         style: new TextStyle(
                           color: Colors.white,
                           backgroundColor: Colors.blue
                         ),),
                 
                  ),
                ),
                
                
                
                
                
                
                ],
              )
            ),
         ),
       );
   }
 }