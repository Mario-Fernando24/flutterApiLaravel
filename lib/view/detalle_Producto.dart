import 'package:apiflutterlogin/view/EditarProducto.dart';
import 'package:apiflutterlogin/view/listarProductos.dart';
import 'package:flutter/material.dart';
import 'package:apiflutterlogin/controllers/crud.dart';

class DetalleProducto extends StatefulWidget {
  List list;
  int index;
  //Hago el constructo y le paso esos parametros
  DetalleProducto({this.index, this.list});

  @override
  _DetalleProductoState createState() => _DetalleProductoState();
}

class _DetalleProductoState extends State<DetalleProducto> {
  Crud crud = new Crud();

  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: new Text(
          "Esta seguro de eliminar '${widget.list[widget.index]['name']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "OK eliminado!",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            crud.eliminarProducto(widget.list[widget.index]['id'].toString());
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => ListarProductos()));
          },
        ),
        new RaisedButton(
          child:
              new Text("Cancelar ", style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: new Text("${widget.list[widget.index]['name']}")),
        body: new Container(
          height: 270.0,
          padding: const EdgeInsets.all(20.0),
          child: new Card(
            child: new Center(
              child: Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),
                  new Text(
                    widget.list[widget.index]['name'],
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  Divider(),
                  new Text(
                    "Precioo: ${widget.list[widget.index]['precio']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                  Divider(),
                  new Text(
                    "Stock: ${widget.list[widget.index]['stock']}",
                    style: new TextStyle(fontSize: 18.0),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new RaisedButton(
                        child: new Text("Editar"),
                        color: Colors.blueAccent,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () => Navigator.of(context).push(
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new EditarProducto(
                                      list: widget.list,
                                      index: widget.index,
                                    ))),
                      ),
                      VerticalDivider(),
                      new RaisedButton(
                        child: new Text("Eliminar"),
                        color: Colors.redAccent,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () => confirm(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
