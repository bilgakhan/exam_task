import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/model/PhotoModel.dart';

class PopularInfoPage extends StatelessWidget {
  final PhotoModel info;

  const PopularInfoPage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    Size mQ = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.file_upload_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: mQ.height * 0.3,
              child: Image.network(info.url.toString(), fit: BoxFit.fill),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info.title.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: mQ.height * 0.02,
                  ),
                  ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            FastCachedImageProvider(info.url.toString()),
                        radius: 30,
                      ),
                      title: const Text("By andy Corbley"),
                      trailing:
                          Text(DateTime.now().toString().substring(11, 16))),
                  SizedBox(
                    height: mQ.height * 0.03,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.messenger_outline_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text("8 comments"),
                      SizedBox(
                        width: 40,
                      ),
                      Icon(Icons.favorite_outline),
                      SizedBox(
                        width: 10,
                      ),
                      Text("34 likes"),
                      SizedBox(
                        width: 40,
                      ),
                      Icon(Icons.share),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Share"),
                    ],
                  ),
                  SizedBox(
                    height: mQ.height * 0.05,
                  ),
                  const Text(
                      "sadfsdgSFGdzsfjgksdrfhaENFBgjrdkfsidaoishfuijoaiDHoAPKDJfzioakijfugSGssd"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
