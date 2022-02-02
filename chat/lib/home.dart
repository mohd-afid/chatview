import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';





class chat extends StatefulWidget {


  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {

  String? username = "";
  String? accesscode = "";

  InAppWebViewController? webViewController;

  String? url = "";
  String? url1 = "https://staging.nearconferences.com/chat/@";




  @override
  void initState() {

   // url = "https://staging.nearconferences.com/chat/@$username:staging.nearconferences.co/$accesscode";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(
        body: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            //   height: height * 0.08,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       SizedBox(
            //         width: width * 0.1,
            //       ),
            //       Text(
            //         "Home",
            //         style: TextStyle(
            //           fontSize: fontSize * 2,
            //           color: nearGrey,
            //         ),
            //       ),
            //       SizedBox(width: width * 0.1),
            //     ],
            //   ),
            // ),

            Expanded(
              child: Container(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(url: Uri.parse("https://www.w3schools.com/")),
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                      mediaPlaybackRequiresUserGesture: false,
                    ),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    webViewController = controller;
                  },
                  androidOnPermissionRequest: (InAppWebViewController controller,
                      String origin, List<String> resources) async {
                    return PermissionRequestResponse(
                        resources: resources,
                        action: PermissionRequestResponseAction.GRANT);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
