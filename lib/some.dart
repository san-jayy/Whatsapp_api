// import 'package:url_launcher/url_launcher.dart';

// class WhatsAppAPIService {
//   //WhatsApp api sending message via urlLauncher
//   sendMessage(int countryCode, int number, String message) async {
//     String url =
//         'https://api.whatsapp.com/send?phone=+$countryCode$number&text=$message';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:whatsapp_api/services/services.dart';

// class HomePage extends StatelessWidget {
//   final TextEditingController messageText = TextEditingController();
//   final TextEditingController numberText = TextEditingController();
//   final TextEditingController countryCodeText = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // setting an initial text to country code text filed
//     // i am from india that's why +91
//     countryCodeText.text = '91';
//     // future Idea - whatever user changes this Country Code in text field -> save it in sharedPrefs and then set that country code next time he opens App
//     double deviceWidth = MediaQuery.of(context).size.width;
//     double deviceHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 8),
//                       width: 82,
//                       height: 70,
//                       decoration: BoxDecoration(
//                         color: Colors.white24,
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                       alignment: Alignment.center,
//                       // TODO : make this a DropBox for internationalization with country codes
//                       /// use this ;) https://pub.dev/packages/country_code_picker
//                       child: TextField(
//                         controller: countryCodeText,
//                         keyboardType: TextInputType.number,
//                         maxLength: 3,
//                         maxLengthEnforced: true,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: Colors.white, fontSize: 25),
//                         decoration: InputDecoration(
//                           prefixText: '+',
//                           prefixStyle:
//                               TextStyle(color: Colors.white, fontSize: 25),
//                           labelStyle: TextStyle(color: Colors.white),
//                           hoverColor: Colors.black26,
//                           border: InputBorder.none,
//                           // hiding the counter
//                           counterStyle: TextStyle(height: double.minPositive),
//                           counterText: '',
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       width: 200,
//                       height: 70,
//                       decoration: BoxDecoration(
//                         color: Colors.white24,
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                       alignment: Alignment.center,
//                       child: TextField(
//                         keyboardType: TextInputType.number,
//                         controller: numberText,
//                         maxLines: 1,
//                         maxLength: 10,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: Colors.white, fontSize: 24),
//                         decoration: InputDecoration(
//                             hintText: 'number',
//                             hoverColor: Colors.black26,
//                             border: InputBorder.none,
//                             // hiding the counter
//                             counterStyle: TextStyle(height: double.minPositive),
//                             counterText: ''),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   width: deviceWidth > 700 ? 600 : deviceWidth * 0.8,
//                   height: deviceHeight * 0.3,
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white24,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                   alignment: Alignment.center,
//                   child: TextField(
//                     controller: messageText,
//                     minLines: 1,
//                     maxLines: null,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                     autofocus: true,
//                     decoration: InputDecoration(
//                       hintText: 'enter your message here',
//                       border: InputBorder.none,
//                       hoverColor: Colors.white38,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 FittedBox(
//                   alignment: Alignment.center,
//                   child: RaisedButton(
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                     hoverColor: Colors.lightGreenAccent,
//                     color: Colors.green[300],
//                     focusColor: Colors.lightGreenAccent,
//                     onPressed: () {
//                       // We can separate the Details checking part in a method as well
//                       // for ease i am doing this all in onTap method
//                       if (countryCodeText.text == null ||
//                           messageText.text == null ||
//                           numberText.text == null) {
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           content: Text("Empty Fields !!"),
//                           duration: Duration(seconds: 3),
//                         ));
//                       } else if (numberText.text.length < 10) {
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           content: Text(
//                               "Wrong Number - length is shorter than 10 !!"),
//                           duration: Duration(seconds: 3),
//                         ));
//                       } else {
//                         try {
//                           // WhatsAppAPIService().sendMessage(
//                           //     int.parse(countryCodeText.text),
//                           //     int.parse(numberText.text),
//                           //     messageText.text);
//                           WhatsAppAPIService().sendMessage(
//                               int.parse(countryCodeText.text),
//                               int.parse(numberText.text),
//                               messageText.text);
//                         } catch (e) {
//                           print(e);
//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                               content: Text("Error !"),
//                               backgroundColor: Colors.red,
//                               behavior: SnackBarBehavior.floating));
//                         }
//                       }
//                     },
//                     // TODO : add dummy messages + user defined  quick messages
//                     // in form of tiles + onTap(){add that specific text to message body textField.}
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(
//                               left: 5, right: 10, top: 3, bottom: 1),
//                           height: 28,
//                           width: 28,
//                           alignment: Alignment.bottomRight,
//                           child: Image.asset(
//                             'assets/icon_whatsapp.png',
//                             fit: BoxFit.scaleDown,
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(50),
//                             ),
//                           ),
//                         ),
//                         Center(
//                           child: Text(
//                             "Send",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
