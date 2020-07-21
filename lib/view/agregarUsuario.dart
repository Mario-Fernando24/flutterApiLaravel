import 'package:flutter/material.dart';
import 'package:apiflutterlogin/controllers/crud.dart';

import '../main.dart';

class UserAgregar extends StatefulWidget {
  //le pasamos como parametro como lo es el key
  UserAgregar({Key key, this.title}) : super(key: key);
  final title;
  @override
  _UserAgregarState createState() => _UserAgregarState();
}

class _UserAgregarState extends State<UserAgregar> {
  //instanciamos nuestro controlador que es el crud
  Crud crud = new Crud();

  String msgStatus = '';

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  _onPressed() {
    setState(() {
      if (_emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().toLowerCase().isNotEmpty) {
        crud.agregarUsuario(
            _nameController.text.trim(),
            _emailController.text.trim().toLowerCase(),
            _passwordController.text.trim());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agregar prdoducto',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Agregar Usuario'),
        ),
        body: Container(
            child: ListView(
          padding: const EdgeInsets.only(
              top: 62, left: 12.0, right: 12.0, bottom: 12.0),
          children: <Widget>[
            //---nombre del producto
            Container(
                height: 50,
                child: new TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    hintText: 'nombre usuario',
                    icon: new Icon(Icons.email),
                  ),
                )),
            //n
            Container(
                height: 50,
                child: new TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Correo usuario',
                    hintText: 'Correo Usuario',
                    icon: new Icon(Icons.account_circle),
                  ),
                )),

            new Padding(
              padding: new EdgeInsets.only(top: 44.0),
            ),

            Container(
                height: 50,
                child: new TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'password',
                    hintText: 'password',
                    icon: new Icon(Icons.apps),
                  ),
                )),

            new Padding(
              padding: new EdgeInsets.only(top: 44.0),
            ),
            //boton
            Container(
              height: 50,
              child: new RaisedButton(
                onPressed: () {
                  crud.agregarUsuario(
                      _nameController.text.trim(),
                      _emailController.text.trim(),
                      _passwordController.text.trim());
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new MainPage(),
                  ));
                },
                color: Colors.blue,
                child: new Text(
                  'Guardar',
                  style: new TextStyle(
                      color: Colors.white, backgroundColor: Colors.blue),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
