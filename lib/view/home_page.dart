import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:invertexto/view/busca_cep_page.dart';
import 'package:invertexto/view/gerador_qr_code_page.dart';
import 'package:invertexto/view/por_extenso_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            GestureDetector(
              child: Row(
                children: const <Widget>[
                  Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 240, 240, 240),
                    size: 70,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Por Extenso",
                    style: TextStyle(
                        color: Color.fromARGB(255, 240, 240, 240),
                        fontSize: 22),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PorExtensoPage()));
              },
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              child: Row(
                children: const <Widget>[
                  Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 240, 240, 240),
                    size: 70,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Busca CEP",
                    style: TextStyle(
                        color: Color.fromARGB(255, 240, 240, 240),
                        fontSize: 22),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BuscaCepPage()));
              },
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              child: Row(
                children: const <Widget>[
                  Icon(
                    Icons.qr_code_2,
                    color: Color.fromARGB(255, 240, 240, 240),
                    size: 70,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Gerar QR Code",
                    style: TextStyle(
                        color: Color.fromARGB(255, 240, 240, 240),
                        fontSize: 22),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GeradorQrCodePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
