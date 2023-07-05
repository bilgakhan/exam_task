import 'package:flutter/material.dart';
import 'package:exam_app/ui/categories/all.dart';
import 'package:exam_app/ui/categories/health.dart';
import 'package:exam_app/ui/categories/politics.dart';
import 'package:exam_app/ui/categories/popular.dart';
import 'package:exam_app/ui/categories/tech.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.blue,
          ),
        ),
        title: const Row(
          children: [
            Icon(Icons.location_on),
            Text(
              "G.T.Road,KolKata",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 70,
                height: 5,
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey),
                        vertical: BorderSide(color: Colors.grey)),
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30), right: Radius.circular(30))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle_notifications_outlined,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "599",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: TabBar(
                labelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: "Popular",
                  ),
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "Politics",
                  ),
                  Tab(
                    text: "Tech",
                  ),
                  Tab(
                    text: "Healthy",
                  ),
                ],
                controller: tabController),
          ),
          Expanded(
              flex: 12,
              child: TabBarView(
                controller: tabController,
                children: screens,
              ))
        ],
      ),
    );
  }

  final List<Widget> screens = const [
    Popular(),
    All(),
    Politics(),
    Tech(),
    Healthy()
  ];
}
