import 'dart:async';

import 'package:aplikasi_tugas_kelas_11/pages/login_page.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late Timer loadTime;
  late Timer loadbool;
  bool load = false;
  @override
  void initState() {
    loadTime = Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
    loadbool=Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        load = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    loadTime.cancel();
    loadbool.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.indigo.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Aplikasi',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Tugas Kelas',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Image.asset('images/tulasap_logo.png', width: 150),
            SizedBox(height: 40),
            Container(
              height: 10,
              width: size.width * 0.7,
              color: Colors.white,
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 2500),
                    height: 20,
                    width: load ? size.width * 0.7 : 0,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Text(
              'Lengkapi tugas-tugas kalian yang belum tuntas',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
