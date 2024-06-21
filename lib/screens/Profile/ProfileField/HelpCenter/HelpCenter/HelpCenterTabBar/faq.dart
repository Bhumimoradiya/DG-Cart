import 'package:digi_cart_furniture/component/appcolors.dart';
import 'package:flutter/material.dart';

class HelpCenterFAQ extends StatefulWidget {
  const HelpCenterFAQ({super.key});

  @override
  State<HelpCenterFAQ> createState() => _HelpCenterFAQState();
}

class _HelpCenterFAQState extends State<HelpCenterFAQ> {
  List listName = ["General", "Account", "Service", "Privacy"];
  var size, height, width;
  int productindex = 0;
  List question = [
    "What is eCommerce?",
    "How to use eCommerce?",
    "How do I cancel a orders product?",
    "Is eCommerce free to use?",
    "How to add promo on eCommerce?"
  ];
  late List<bool> flag;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    flag = List<bool>.filled(question.length, false);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 20),
            child: SizedBox(
              height: 42,
              width: width * 2,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: listName.length,
                  itemBuilder: ((BuildContext context, int index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent, backgroundColor: index == productindex
                                  ? Appcolors.primarycolor
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Appcolors.primarycolor),
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            setState(() {
                              productindex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              listName[index],
                              style: TextStyle(
                                  fontSize: 14,
                                  color: index == productindex
                                      ? Colors.white
                                      : Appcolors.primarycolor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    );
                  })),
            ),
          ),
          textFormField(title: "Search", type: TextInputType.text),
          Question_Answer(),
        ],
      )),
    );
  }

  Widget Question_Answer() {
    return SizedBox(
      height: height * 0.62,
      child: ListView.builder(
          itemCount: question.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: flag[index]
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 10, top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  question[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        flag[index] = !flag[index];
                                      });
                                    },
                                    icon: ImageIcon(
                                      AssetImage(
                                          "assets/images/Arrow - Down 2.png"),
                                      size: 22,
                                    ))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text(
                                "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    height: 1.3),
                              ),
                            )
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 10, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              question[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    flag[index] = !flag[index];
                                  });
                                },
                                icon: ImageIcon(
                                  AssetImage(
                                      "assets/images/Arrow - Down 2.png"),
                                  size: 22,
                                ))
                          ],
                        ),
                      ),
              ),
            );
          }),
    );
  }

  Widget textFormField({
    required String title,
    required TextInputType type,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 0),
      child: SizedBox(
        height: 60,
        child: TextFormField(
          keyboardType: type,
          style: TextStyle(
            color: Colors.black54,
            // fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          cursorColor: Colors.grey.shade400,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: ImageIcon(
                AssetImage("assets/images/SearchIcon.png"),
                color: Colors.black,
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 1, color: Colors.grey.shade300)),
            contentPadding: EdgeInsets.all(15),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 1, color: Colors.grey.shade300)),
            hintText: title,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 1, color: Colors.grey.shade300)),
            hintStyle: TextStyle(
              color: Colors.grey.shade300,
              // fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
