import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                // ชื่อแอป
                Text(
                  'TRACK-SURE',
                  style: GoogleFonts.alumniSansInlineOne(
                    fontSize: 65,
                    color: Colors.white,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(height: 80),
                // ข้อความเข้าสู่ระบบ
                Text(
                  'เข้าสู่ระบบ',
                  style: GoogleFonts.prompt(fontSize: 42, color: Colors.green),
                ),
                SizedBox(height: 80),

                // ฟอร์มกรอกชื่อผู้ใช้
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'ชื่อผู้ใช้',
                    labelStyle: TextStyle(color: Colors.green),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // ฟอร์มกรอกรหัสผ่าน
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'รหัสผ่าน',
                    labelStyle: TextStyle(color: Colors.green),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _passwordController.text = _passwordController.text;
                        });
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // เมื่อกดลืมรหัสผ่าน ให้แสดง Dialog หรือไปที่หน้าการรีเซ็ตรหัสผ่าน
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('ลืมรหัสผ่าน'),
                          content: TextField(
                            decoration: InputDecoration(
                              labelText: 'กรุณากรอกอีเมลของคุณ',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('ยกเลิก'),
                              onPressed: () {
                                Navigator.of(context).pop(); // ปิด Dialog
                              },
                            ),
                            TextButton(
                              child: Text('รีเซ็ตรหัสผ่าน'),
                              onPressed: () {
                                // เพิ่ม logic สำหรับการรีเซ็ตรหัสผ่านที่นี่
                                Navigator.of(context).pop(); // ปิด Dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'ลืมรหัสผ่าน?',
                    style: TextStyle(
                      color: Colors.blue, // สีของข้อความ
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // ปุ่มเข้าสู่ระบบ
                ElevatedButton(
                  onPressed: () {
                    // เพิ่ม logic สำหรับเข้าสู่ระบบที่นี่
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text('เข้าสู่ระบบ'),
                ),
                SizedBox(height: 20),

                // ข้อความสมัครสมาชิก
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ถ้าคุณยังไม่ได้เป็นสมาชิกแอป Track-SURE'),
                    TextButton(
                      onPressed: () {
                        // เพิ่ม logic สำหรับสมัครสมาชิกที่นี่
                      },
                      child: Text('สมัครสมาชิก'),
                    ),
                  ],
                ),

                // ลืมรหัสผ่าน
              ],
            ),
          ),
        ),
      ),
    );
  }
}
