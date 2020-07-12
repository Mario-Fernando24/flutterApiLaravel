import 'dart:convert';

import 'package:apiflutterlogin/view/agregarProducto.dart';
import 'package:apiflutterlogin/view/listarProductos.dart';
import 'package:apiflutterlogin/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Codigo Alpha Flutter",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(
        accentColor: Colors.white70
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 //sharedPrederences es para que me mantenga el estado
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    //aqui para que compruebe el estado para que no le toque estar logueando cada ves que se salga de la apliccion
    sharedPreferences = await SharedPreferences.getInstance();
    //se el sharead es igual a vacio que nos mande al login
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }
//este es un menu lateral
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Startogo", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
            },
            child: Text("Salir", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(child: Text("inicio")),
      drawer: Drawer(
        child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text('Startogo'),
                  accountEmail: new Text('3115408069.mafe@gmail.com'),
                  // decoration: new BoxDecoration(
                  //   image: new DecorationImage(
                  //     fit: BoxFit.fill,
                  //    // image: AssetImage('img/estiramiento.jpg'),
                  //   )
                  // ),
                ),
       
                 new Divider(),
                  
                  new ListTile(
                  title: new Text("Inicio"),
                  trailing: new Icon(Icons.home),
                  onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                    //LLAMO A LA CLASE LISTAR PRODUCTO 
                    builder: (BuildContext context)=>AgregarProducto(),
                    ))

                ),



                  new Divider(),
                  
                  new ListTile(
                  title: new Text("Perfil"),
                  trailing: new Icon(Icons.account_circle),
                  onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                    //LLAMO A LA CLASE LISTAR PRODUCTO 
                    builder: (BuildContext context)=>AgregarProducto(),
                    ))

                ),


                 new Divider(),
                  
                  new ListTile(
                  title: new Text("Pedidos Activos"),
                  trailing: new Icon(Icons.local_pizza),
                  onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                    //LLAMO A LA CLASE LISTAR PRODUCTO 
                    builder: (BuildContext context)=>AgregarProducto(),
                    ))

                ),

                  new Divider(),
                  
                  new ListTile(
                  title: new Text("Historial de Pedidos"),
                  trailing: new Icon(Icons.history),
                  onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                    //LLAMO A LA CLASE LISTAR PRODUCTO 
                    builder: (BuildContext context)=>AgregarProducto(),
                    ))

                ),


               
                  new Divider(),
                  
                  new ListTile(
                  title: new Text("Mi billetera"),
                  trailing: new Icon(Icons.attach_money),
                  onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                    //LLAMO A LA CLASE LISTAR PRODUCTO 
                    builder: (BuildContext context)=>AgregarProducto(),
                    ))

                ),
                

                   new Divider(),
                  
                  new ListTile(
                  title: new Text("Estadisticas"),
                  trailing: new Icon(Icons.info),
                  onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                    //LLAMO A LA CLASE LISTAR PRODUCTO 
                    builder: (BuildContext context)=>AgregarProducto(),
                    ))

                ),
                

                new Divider(),
                
                new ListTile(
                  title: new Text("Listar Producto"),
                  trailing: new Icon(Icons.account_circle),
                  onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                    //LLAMO A LA CLASE LISTAR PRODUCTO 
                    builder: (BuildContext context)=>ListarProductos(),
                    ))

                ),
                 
                  new Divider(),
                  
                  new ListTile(
                  title: new Text("Agregar producto"),
                  trailing: new Icon(Icons.account_circle),
                  onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                    //LLAMO A LA CLASE LISTAR PRODUCTO 
                    builder: (BuildContext context)=>AgregarProducto(),
                    ))

                ),

              ],
            ),
      ),
    );
  }
}