import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kch_news_app/kch_fm_news.dart';

//homepage
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Kch y Huancavilca News Boot'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // KCh Radio
          Card(
            color: Colors.yellow,
            elevation: 12,
            margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KChFMNews(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "Presionar Ingreso App News",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      ),
                      Text(
                        "Radio KCh FM",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.indigo,
            child: const Text(
              'Desarrollado por D.Ch. para Radios KCh y Huancavilca',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
