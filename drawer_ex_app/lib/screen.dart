import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mail'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/sendMail');
            },
            icon: Icon(Icons.mail),
          ),
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/receivedMail');
            },
            icon: Icon(Icons.mail_outline),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/1.png'),
                backgroundColor: Colors.white,
              ),
              accountName: Text('Pikachu'), 
              accountEmail: Text('pikachu@naver.com'),
              onDetailsPressed: (){
                print("main page is clicked");
              },
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.mail,
                color: Colors.blue,
              ),
              title: Text('보낸 편지함'),
              onTap: (){
                print('보낸 편지함 is cilcked');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.mail_outline,
                color: Colors.red,
              ),
              title: Text('받은 편지함'),
              onTap: (){
                print('받은 편지함 is cilcked');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/sendMail');
              },
              child: Text('보낸 편지함'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/receivedMail');
              },
              child: Text('받은 편지함'),
            ),
          ],
        ),
      ),
    );
  }
}

void sendEmail(BuildContext context) {
  Navigator.pushNamed(context, '/send');
}

void receivedEmail(BuildContext context) {
  Navigator.pushNamed(context, '/received');
}