import 'package:flutter/material.dart';

class HelpCenterContactUs extends StatefulWidget {
  const HelpCenterContactUs({super.key});

  @override
  State<HelpCenterContactUs> createState() => _HelpCenterContactUsState();
}

class _HelpCenterContactUsState extends State<HelpCenterContactUs> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            cardWidget(
                name: "Customer Service", image: "assets/images/music.png"),
            cardWidget(name: "Whatsapp", image: "assets/images/whatsapp.png"),
            cardWidget(name: "Website", image: "assets/images/website.png"),
            cardWidget(name: "Facebook", image: "assets/images/facebook.png"),
            cardWidget(name: "Twitter", image: "assets/images/twitter.png"),
            cardWidget(name: "Instagram", image: "assets/images/instagram.png"),
          ],
        ),
      ),
    );
  }

  Widget cardWidget({
    required String name,
    required String image,
  }) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
        child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(20)),
            shadowColor: Colors.transparent,
            // color: Color.fromARGB(95, 238, 238, 238),
            child: Container(
                height: 70,
                width: width,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 0, top: 6, right: 0, bottom: 10),
                    child: ListTile(
                      title: Text(
                        name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 18),
                      ),
                      leading: Image.asset(
                        image,
                        height: 25,
                      ),
                    )))));
  }
}
