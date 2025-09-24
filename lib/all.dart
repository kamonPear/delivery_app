import 'dart:io';
import 'package:flutter/material.dart';

class AllPage extends StatelessWidget {
  File? _vehicleImage; // ตัวแปรสำหรับเก็บรูปภาพ

  // ฟังก์ชันในการเลือกภาพจากแกลเลอรี่
  Future<void> _pickImage() async {
    // ใช้ ImagePicker หรือวิธีอื่นๆในการเลือกภาพ
    // สำหรับตัวอย่างนี้จะใช้ `ImagePicker` หรือสามารถใช้การเลือกจากแหล่งอื่นๆ
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/main1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ข้อความต้อนรับ
              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ข้อความต้อนรับ
                  // Text(
                  //   'สวัสดี',
                  //   style: TextStyle(
                  //     fontSize: 32,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  Text(
                    'สวัสดี คุณ Patcharadanai',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 25), // เพิ่มระยะห่างระหว่างข้อความและโปรไฟล์
                  // กรอบวงกลมโปรไฟล์
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 2),
                        ),
                        child: ClipOval(
                          child: _vehicleImage != null
                              ? Image.file(
                                  _vehicleImage!,
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 80,
                                )
                              : Container(
                                  color: Colors.grey[300],
                                  width: 100,
                                  height: 100,
                                  child: Center(
                                    child: Icon(
                                      Icons.add_a_photo,
                                      color: Colors.green,
                                      size: 25,
                                    ),
                                  ),
                                ),
                        ),
                      ),

                      // ปุ่มเลือกภาพ
                    ],
                  ),
                ],
              ),

              // ช่องค้นหาผู้ใช้สินค้า
              Container(
                width: 300,
                height: 50, // กำหนดความกว้างของ TextField
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.green),
                    hintText: 'ค้นหาผู้รับสินค้า',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                ),
              ),
  Container(
  width: double.infinity, // กำหนดให้ช่องกว้างเต็มที่
  padding: EdgeInsets.symmetric(horizontal: 0.0), // เพิ่มระยะห่างจากขอบ
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center, // จัดให้ข้อความและไอคอนอยู่ในแนวนอนตรงกลาง
    children: [
      Icon(
        Icons.location_on, // ใช้ไอคอนที่คุณต้องการ
        color: Colors.white,
        size: 24, // ขนาดของไอคอน
      ),
      Padding(
        padding: EdgeInsets.only(left: 0), // ลดระยะห่างระหว่างไอคอนและข้อความ
        child: Text(
          'หอพักเมธาพาลาสโซ่',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 4,
          ),
          overflow: TextOverflow.ellipsis, // เมื่อข้อความยาวเกินไป จะตัดด้วย "..."
        ),
      ),
    ],
  ),
 ),



              SizedBox(height: 30),
              // ปรับปุ่มต่างๆให้มีขนาดที่กำหนดเอง
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCustomButton(
                    'assets/image/order.png',
                    'สั่งสินค้า',
                    160,
                    90,
                  ),
                  _buildCustomButton('assets/image/order2.png', 'สถานะพัสดุ', 160, 90),
                ],
              ),
              
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCustomButton(
                    'assets/image/order3.png',
                    'พัสดุที่ต้องรับ',
                    120,
                    120,
                  ),
                  _buildCustomButton(
                    'assets/image/order4.png',
                    'คุยกับไรเดอร์',
                    120,
                    120,
                  ),
                  _buildCustomButton(
                    'assets/image/order5.png',
                    'ส่วนลดแพ็กเก็จ',
                    120,
                    120,
                  ),
                ],
              ),
              SizedBox(height: 30),

              // ส่วนโปรโมชัน
            ],
          ),
        ),
      ),
    );
    
    
  }
  
  // สร้าง Widget สำหรับปุ่มที่กำหนดขนาดเอง
  Widget _buildCustomButton(
    String imagePath,
    String label,
    double width,
    double height,
  ) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          // เพิ่มฟังก์ชันเมื่อกดปุ่มที่นี่
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Image.asset(
                imagePath,  // ใช้ path ของรูปภาพที่คุณต้องการ
                width: 50,  // กำหนดขนาดรูปภาพที่แสดง
                height: 50,
              ),
              SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                overflow: TextOverflow.ellipsis, // ป้องกันข้อความล้น
              ),
            ],
          ),
        ),
      ),
    );
  }
}