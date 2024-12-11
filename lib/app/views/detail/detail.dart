import 'package:animator/app/views/homepage/model/json/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    AllData alldata = ModalRoute.of(context)?.settings.arguments as AllData;

    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "lib/app/assets/home.png",
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.12, // Adjust height dynamically
                          width: screenWidth * 0.06,  // Adjust width dynamically
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: screenHeight * 0.08, // Adjust height dynamically
                            width: screenWidth * 0.12,  // Adjust width dynamically
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(color: Colors.white, width: 3.5),
                              color: Colors.black,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: screenWidth * 0.8,  // Adjust width dynamically
                      height: screenHeight * 0.35, // Adjust height dynamically
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(alldata.image),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        alldata.name,
                        style: const TextStyle(
                          fontFamily: "appbar",
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            height: screenHeight * 0.05,  // Adjust height dynamically
                            width: screenWidth * 0.08,  // Adjust width dynamically
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("lib/app/assets/moon.png"),
                              ),
                            ),
                          ),
                          Text(
                            alldata.moon,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "content",
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Container(
                            height: screenHeight * 0.05,  // Adjust height dynamically
                            width: screenWidth * 0.08,  // Adjust width dynamically
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("lib/app/assets/sky.png"),
                              ),
                            ),
                          ),
                          Text(
                            alldata.revolution,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "content",
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            height: screenHeight * 0.05,  // Adjust height dynamically
                            width: screenWidth * 0.08,  // Adjust width dynamically
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "lib/app/assets/thermometer.png"),
                              ),
                            ),
                          ),
                          Text(
                            alldata.temperature,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "content",
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        alldata.content,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "content",
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,  // Adjust height dynamically
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: screenHeight * 0.04,  // Adjust height dynamically
                        width: screenWidth * 0.5,   // Adjust width dynamically
                        decoration: BoxDecoration(
                            color: Color(
                              int.parse(
                                alldata.color,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: GestureDetector(
                          onTap: () {
                            launchUrl(
                              Uri.parse('${alldata.source}'),
                            );
                          },
                          child: Text(
                            "Explore more",
                            style: TextStyle(
                                fontFamily: "content",
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




