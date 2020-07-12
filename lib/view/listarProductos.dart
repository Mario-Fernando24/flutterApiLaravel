import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//stf 
class ListarProductos extends StatefulWidget {
  @override
  _ListarProductosState createState() => _ListarProductosState();
}

class _ListarProductosState extends State<ListarProductos> {
  //listar toda la informacion de los productos en unas tarjetas
  List data;
   
   Future<List> getProducto() async{
           //instancio todos los productos
          final response = await http.get("http://192.168.1.20:8000/api/products");
          //lo retornamos en un json
          return json.decode(response.body);
        }

          @override
          //para que cuando cargue nuestra aplicacion es ejecutar esta funcion get 
          void initState(){
            super.initState();
            this.getProducto();
          }
                
        @override
        Widget build(BuildContext context) {
         return new Scaffold(
               appBar: new AppBar(
                   title: new Text("Lista de productos"),
               ),
             body: new FutureBuilder<List>(
               future: getProducto(),
               builder: (context, snapshot){
                 if(snapshot.hasError) print(snapshot.hasError);
                  return snapshot.hasData
                  ? new ItemList(
                    list: snapshot.data,
                  )
                  : new Center(
                     child: new CircularProgressIndicator(),
                  );
               },
               ),
          );
        }
}



class ItemList extends  StatelessWidget{
  
  final List list;
  ItemList({this.list});

  @override

  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context, i){
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: (){},
            child: new Card (
              child: new ListTile(
                title: new Text(
                  list[i]['name'].toString(),
                  style: TextStyle(fontSize: 25.0, color: Colors.deepOrangeAccent),
                )
              ),
            ),
          )
        );

      },
      );
  }


}