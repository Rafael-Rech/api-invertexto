import 'package:flutter/material.dart';
import 'package:invertexto/service/invertexto_service.dart';

class BuscaCepPage extends StatefulWidget {
  const BuscaCepPage({super.key});

  @override
  State<BuscaCepPage> createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {
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
                labelText: "Digite um CEP",
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
                future: (campo != null)? buscaCep(campo) : null,
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
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        // (asyncSnapshot.data["street"] != null)
        //     ? "${asyncSnapshot.data["street"]}, ${asyncSnapshot.data["neighborhood"]}: ${asyncSnapshot.data["city"]} - ${asyncSnapshot.data["state"]}"
        //     : "",
        "${asyncSnapshot.data["street"]}, ${asyncSnapshot.data["neighborhood"]}: ${asyncSnapshot.data["city"]} - ${asyncSnapshot.data["state"]}",
        style: const TextStyle(
          color: Color.fromARGB(255, 240, 240, 240),
          fontSize: 22.0,
        ),
      ),
    );
  }
}
