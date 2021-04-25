import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whatsapp_Api'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.red,
          child: Column(
            children: [
              Row(
                children: [
                  TextField(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
