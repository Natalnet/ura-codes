import 'package:example/components/buttons_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> get _tabs => const [
        Tab(
          text: 'Buttons',
        ),
        Tab(
          text: 'Cards',
        )
      ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          toolbarHeight: 200,
          backgroundColor: Colors.grey[100],
          title: const Image(
            image: AssetImage("assets/blue.png"),
            height: 200,
          ),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.blueGrey[600],
            indicatorWeight: 3,
            indicatorColor: Colors.blue[900],
            tabs: _tabs,
          ),
        ),
        body: const Center(
          child: SizedBox(
            width: kIsWeb ? 400 : double.maxFinite,
            child: TabBarView(children: [
              ButtonsPage(),
              ButtonsPage(),
            ]),
          ),
        ),
      ),
    );
  }
}
