import 'package:flutter/painting.dart';

import 'package:flutter/material.dart';
import 'package:joke_test/services/api_service.dart';

JokesApi jokesApi = JokesApi();

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String jokeAnswer = '';
  bool isVisble = true;
  var joke = jokesApi.getJokes();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Make me Laugh!"),
      ),
      body: FutureBuilder(
        future: joke,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data.setUp,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Sofia',
                      color: Colors.black,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        jokeAnswer = snapshot.data.punchLine;
                        isVisble = false;
                      });
                    },
                    child: Visibility(
                      visible: isVisble,
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 10.0,
                          bottom: 10,
                        ),
                        child: Text(
                          "Check Out!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Sofia',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    jokeAnswer,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Sofia',
                      color: Colors.black,
                    ),
                  ),

                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(18.0),
                  //     child: Text.rich(
                  //       textAlign: TextAlign.center,
                  //       TextSpan(
                  //         children: [
                  //           TextSpan(
                  //             text: snapshot.data.setUp,
                  //             style: const TextStyle(
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.normal,
                  //               fontFamily: 'Sofia',
                  //               color: Colors.black,
                  //             ),
                  //           ),
                  //           const TextSpan(

                  //             text: 'Check it out!',
                  //             style: TextStyle(
                  //               decoration: TextDecoration.underline,
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w500,
                  //               fontFamily: 'Sofia',
                  //               color: Colors.black,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
