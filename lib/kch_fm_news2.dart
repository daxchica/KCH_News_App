import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_scraper/web_scraper.dart';

import 'homepage.dart';

class KChFMNews2 extends StatefulWidget {
  const KChFMNews2({Key? key}) : super(key: key);

  @override
  _KChFMNews2State createState() => _KChFMNews2State();
}

class _KChFMNews2State extends State<KChFMNews2> {
  // initialize WebScraper by passing base url of website
  final webScraper = WebScraper('https://www.kchcomunicacion.com');

  // Response of getElement is always List<Map<String, dynamic>>
  List<Map<String, dynamic>>? productNames;
  // late List<Map<String, dynamic>> productDescriptions;

  void fetchProducts() async {
    // Loads web page and downloads into local state of library
    if (await webScraper.loadWebPage('/economia/')) {
      setState(
        () {
          // getElement takes the address of html tag/element and attributes you want to scrap from website
          // it will return the attributes in the same order passed
          productNames = webScraper
              .getElement('div > div.entry-blog-header > h2 > a', ['href']);

          // productDescriptions = webScraper
          //     .getElement('div > div:nth-child(2) > div > div.entry-blog-summery > p', ['class']);
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // Requesting to fetch before UI drawing starts
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('KCh FM News'),
          leading: IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(title: ''),
                ),
              );
            },
          ),
        ),
        body: SafeArea(
          child: productNames == null
              ? const Center(
                  child:
                      CircularProgressIndicator(), // Loads Circular Loading Animation
                )
              : ListView.builder(
                  itemCount: productNames!.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Attributes are in the form of List<Map<String, dynamic>>.
                    Map<String, dynamic> attributes =
                        productNames![index]['attributes'];
                    return ExpansionTile(
                      title: Text(attributes['href']),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  // child:
                                  // Text(productDescriptions[index]['class']),
                                  // margin: const EdgeInsets.only(bottom: 10.0),
                                  ),
                              InkWell(
                                onTap: () {
                                  // uses UI Launcher to launch in web browser & minor tweaks to generate url
                                  launch(
                                      // webScraper.baseUrl! +
                                      attributes['href']);
                                },
                                child: const Text(
                                  'Leer Articulo',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
