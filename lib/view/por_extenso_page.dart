import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:invertexto/service/invertexto_service.dart';

class PorExtensoPage extends StatefulWidget {
  const PorExtensoPage({super.key});

  @override
  State<PorExtensoPage> createState() => _PorExtensoPageState();
}

class _PorExtensoPageState extends State<PorExtensoPage> {
  String? campo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 25, 25),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/imgs/invertexto.png",
              fit: BoxFit.contain,
              height: 40,
            ),
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Digite um número",
                labelStyle:
                    TextStyle(color: Color.fromARGB(255, 240, 240, 240)),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Color.fromARGB(255, 240, 240, 240),
                fontSize: 18,
              ),
              onSubmitted: (value) {
                setState(() {
                  campo = value;
                });
              },
            ),
            Expanded(
              child: FutureBuilder(
                future: campo == null? null : converteNumeroPorExtenso(campo),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 240, 240, 240),
                          ),
                          strokeWidth: 5.0,
                        ),
                      );
                    case ConnectionState.none:
                      return Container();
                    default:
                      if (snapshot.hasError) {
                        return Container();
                      }
                      return exibeResultado(context, snapshot);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget exibeResultado(
      BuildContext buildContext, AsyncSnapshot asyncSnapshot) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Text(
          // (asyncSnapshot.data["text"] != null)? asyncSnapshot.data["text"] : "",
          asyncSnapshot.data["text"],
          style: TextStyle(
            color: Color.fromARGB(255, 240, 240, 240),
            fontSize: 22.0,
          ),
      ),
    );
  }
}
