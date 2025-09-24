import 'package:flutter/material.dart';

class EditRider extends StatefulWidget {
  const EditRider({super.key});

  @override
  State<EditRider> createState() => _EditRiderState();
}

class _EditRiderState extends State<EditRider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/main1.png'), // ใส่ภาพพื้นหลังที่คุณต้องการ
            fit: BoxFit.cover, // กำหนดให้ภาพครอบคลุมทั้งหน้าจอ
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ใส่รูปโปรไฟล์
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/image/pro2.jpg', // ใส่ path ของรูปโปรไฟล์ที่คุณต้องการ
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                  SizedBox(width: 20), // เพิ่มระยะห่างระหว่างรูปภาพและข้อความ
                  // ข้อความ "สวัสดีคุณ .........."
                  Text(
                    'สวัสดีคุณ Patcharadanai', // ใส่ชื่อผู้ใช้หรือข้อมูลที่ต้องการแสดง
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 5.5,
                    ),
                  ),
                ],
              ),
             

              // ข้อความ "แก้ไขข้อมูลส่วนตัว"
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0), // ลดระยะห่างระหว่างข้อความ
                    child: Text(
                      'แก้ไขข้อมูลส่วนตัว',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.7,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30), // เพิ่มช่องว่างใต้ข้อความ "แก้ไขข้อมูลส่วนตัว"
            ],
          ),
        ),
      ),

      // เพิ่ม Bottom Navigation Bar ที่ด้านล่าง
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // ตำแหน่งที่เลือก
        onTap: (int index) {
          // คุณสามารถใส่การทำงานเมื่อกดที่แท็บที่นี่
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'ประวัติการส่งสินค้า',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'ออกจากระบบ',
          ),
        ],
        selectedItemColor: const Color.from(alpha: 1, red: 0.298, green: 0.686, blue: 0.314), // สีของไอคอนที่เลือก
        unselectedItemColor: Colors.white, // สีของไอคอนที่ไม่ได้เลือก
        backgroundColor: const Color(0xFF11598D), // สีพื้นหลังของแท็บ
      ),
    );
  }
}
