import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/provider/PhotoProvider.dart';
import 'package:exam_app/ui/popular.dart';
import 'package:provider/provider.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    Size mQ = MediaQuery.sizeOf(context);
    PhotoProvider photoProvider = Provider.of<PhotoProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => PhotoProvider(),
      builder: (context, child) {
        return Builder(builder: (context) {
          if (photoProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (photoProvider.error.isNotEmpty) {
            return Center(
              child: Text(photoProvider.error),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PopularInfoPage(
                                      info: photoProvider.data[index])));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FastCachedImageProvider(
                                      photoProvider.data[index].url.toString()),
                                  fit: BoxFit.fill),
                              color: Colors.blue,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    photoProvider.data[index].title.toString(),
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "adcssdlvkmaslkvmklasnmvlkasfvdcsd",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: mQ.width * 0.6,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(20),
                                    right: Radius.circular(20)),
                                color: Colors.grey.shade300,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mQ.width * 0.03,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          isTap = !isTap;
                                        });
                                      },
                                      child: isTap
                                          ? const Icon(
                                              Icons.check_circle_outline)
                                          : const Icon(Icons.circle_outlined)),
                                  SizedBox(
                                    width: mQ.width * 0.05,
                                  ),
                                  const Text("ms Dhoni"),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: mQ.width * 0.6,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(20),
                                    right: Radius.circular(20)),
                                color: Colors.grey.shade300,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mQ.width * 0.03,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          isTap = !isTap;
                                        });
                                      },
                                      child: isTap
                                          ? const Icon(
                                              Icons.check_circle_outline)
                                          : const Icon(Icons.circle_outlined)),
                                  SizedBox(
                                    width: mQ.width * 0.05,
                                  ),
                                  const Text("Virat kahli"),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: mQ.width * 0.6,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(20),
                                    right: Radius.circular(20)),
                                color: Colors.grey.shade300,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mQ.width * 0.03,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          isTap = !isTap;
                                        });
                                      },
                                      child: isTap
                                          ? const Icon(
                                              Icons.check_circle_outline)
                                          : const Icon(Icons.circle_outlined)),
                                  SizedBox(
                                    width: mQ.width * 0.05,
                                  ),
                                  const Text("Rohit Shama"),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: mQ.width * 0.27,
                              height: 30,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(20),
                                    right: Radius.circular(20)),
                                color: Colors.blue,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mQ.width * 0.05,
                                  ),
                                  const Text(
                                    "See Results",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: photoProvider.data.length,
            );
          }
        });
      },
    );
  }
}
