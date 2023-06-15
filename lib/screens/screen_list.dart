import 'package:flutter/material.dart';

class ScreenListForChat extends StatefulWidget {
  const ScreenListForChat({super.key});

  @override
  State<ScreenListForChat> createState() => _ScreenListForChatState();
}

class _ScreenListForChatState extends State<ScreenListForChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextButton(
          child: const Text('List View',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
          onPressed: () => {
            Navigator.of(context).pop(),
          },
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 15,
          itemBuilder: (context, index) {
            return Align(
              alignment: Alignment.center,
              child: ListTile(
                title: Text('Person $index'),
                subtitle: const Text('Text Message'),
                trailing: Text('$index : $index PM'),
                leading: index % 2 == 0
                    ? const CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/dark-background.png'),
                      )
                    : Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 60,
                        child: Image.asset('assets/second_logo.jpg'),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
