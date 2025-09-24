import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _gpsController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();

  String _userType = 'ผู้ใช้'; // Default is user
  File? _vehicleImage;

  // ฟังก์ชันเลือกภาพ
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _vehicleImage = File(pickedFile.path);
      });
    }
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Center(
                child: Text(
                  'TRACK-SURE',
                  style: GoogleFonts.alumniSansInlineOne(
                    fontSize: 65,
                    color: Colors.white,
                    letterSpacing: 3,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'สมัครสมาชิก',
                  style: GoogleFonts.prompt(fontSize: 42, color: Colors.green),
                ),
              ),
              SizedBox(height: 10),

              // ปรับให้ปุ่มทั้งสองอยู่ในช่องเดียวกันและเชื่อมกัน
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ปุ่มผู้ใช้
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _userType = 'ผู้ใช้';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.green, // สีพื้นหลังคงเป็นเขียว
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20),
                              right: Radius.zero,
                            ),
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  'ผู้ใช้',
                                  style: TextStyle(
                                    color: _userType == 'ผู้ใช้'
                                        ? Colors.red
                                        : const Color.fromARGB(
                                            255,
                                            209,
                                            209,
                                            209,
                                          ), // สีตัวหนังสือเป็นสีแดงเมื่อเลือก
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // เส้นข้างล่าง
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                width: 100, // ปรับความยาวของเส้นตรงนี้ให้สั้นลง
                                height: 2,
                                color: _userType == 'ผู้ใช้'
                                    ? Colors.red
                                    : const Color.fromARGB(
                                        251,
                                        249,
                                        249,
                                        249,
                                      ), // เส้นแดงเมื่อเลือก
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // เส้นเชื่อมกลาง (เส้นที่ขึ้นจากกลาง)
                    Container(
                      width: 2,
                      height: 50, // เส้นขึ้นมาจากตรงกลาง
                      color: Colors.white, // สีเส้นกลางเป็นสีขาว
                    ),
                    // ปุ่มไรเดอร์
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _userType = 'ไรเดอร์';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.green, // สีพื้นหลังคงเป็นเขียว
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.zero,
                              right: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  'ไรเดอร์',
                                  style: TextStyle(
                                    color: _userType == 'ไรเดอร์'
                                        ? Colors.red
                                        : const Color.fromARGB(
                                            255,
                                            219,
                                            219,
                                            219,
                                          ), // สีตัวหนังสือเป็นสีแดงเมื่อเลือก
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // เส้นข้างล่าง
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                width: 100, // ปรับความยาวของเส้นตรงนี้ให้สั้นลง
                                height: 2,
                                color: _userType == 'ไรเดอร์'
                                    ? Colors.red
                                    : const Color.fromARGB(
                                        255,
                                        243,
                                        243,
                                        243,
                                      ), // เส้นแดงเมื่อเลือก
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // กรอบสำหรับเพิ่มรูปมอเตอร์ไซค์
              // กรอบสำหรับเพิ่มรูปมอเตอร์ไซค์
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // กรอบวงกลม
                    Container(
                      width: 160, // ขยายขนาดกรอบให้ใหญ่ขึ้น
                      height: 160, // ขยายขนาดกรอบให้ใหญ่ขึ้น
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.green,
                          width: 5,
                        ), // ขยายเส้นขอบให้ใหญ่ขึ้น
                      ),
                      child: ClipOval(
                        child: _vehicleImage != null
                            ? Image.file(
                                _vehicleImage!,
                                fit: BoxFit.cover,
                                width: 160, // ขยายขนาดภาพให้ใหญ่ขึ้น
                                height: 160,
                              )
                            : Container(
                                // เมื่อไม่มีภาพ ให้แสดงช่องว่างที่ว่าง
                                color: Colors
                                    .grey[300], // สีพื้นหลังในกรณีที่ไม่มีรูป
                                width: 160,
                                height: 160,
                                child: Center(
                                  child: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.green,
                                    size: 40,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    // ปุ่มเลือกภาพ
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: _pickImage,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(12), // ขยายขนาดปุ่ม
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 40,
                          ), // ขยายขนาดไอคอน
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              // ส่วนกรอกข้อมูลทั้งหมดใส่ใน Scrollbar
              Expanded(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField(
                          _usernameController,
                          'ชื่อผู้ใช้',
                          Icons.person,
                        ),
                        SizedBox(height: 10),
                        _buildTextField(_emailController, 'อีเมล', Icons.email),
                        SizedBox(height: 10),
                        _buildTextField(
                          _addressController,
                          'ที่อยู่',
                          Icons.location_on,
                        ),
                        SizedBox(height: 10),
                        _buildTextField(
                          _phoneController,
                          'เบอร์โทรศัพท์',
                          Icons.phone,
                        ),
                        SizedBox(height: 10),
                        _buildTextField(
                          _passwordController,
                          'รหัสผ่าน',
                          Icons.lock,
                          obscureText: true,
                        ),
                        SizedBox(height: 10),
                        _buildTextField(
                          _gpsController,
                          'พิกัด GPS',
                          Icons.location_on,
                        ),
                        SizedBox(height: 20),

                        // ฟอร์มไรเดอร์
                        if (_userType == 'ไรเดอร์') ...[
                          _buildTextField(
                            _licensePlateController,
                            'หมายเลขทะเบียนรถ',
                            Icons.confirmation_number,
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: ElevatedButton(
                              onPressed: _pickImage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 60,
                                  vertical: 12,
                                ), // ปรับขนาดปุ่ม
                                foregroundColor: Colors.white,
                                textStyle: TextStyle(fontSize: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text('เลือกภาพรถมอเตอร์ไซค์'),
                            ),
                          ),
                          SizedBox(height: 15),
                          if (_vehicleImage != null) ...[
                            Image.file(
                              _vehicleImage!,
                              height: 130,
                              width: 130,
                              fit: BoxFit.cover,
                            ),
                          ],
                          SizedBox(height: 20),
                        ],
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              print('สมัครเป็น: $_userType');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.symmetric(
                                horizontal: 90,
                                vertical: 12,
                              ), // ปรับขนาดปุ่ม
                              foregroundColor: Colors.white,
                              textStyle: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text('สมัครสมาชิก'),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('มีบัญชีอยู่แล้ว?'),
                              TextButton(
                                onPressed: () {},
                                child: Text('เข้าสู่ระบบ'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    bool obscureText = false,
  }) {
    return Container(
      width: 370, // ปรับให้ช่องกรอกข้อมูลขวามีความกว้าง 250
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.green,
            fontSize: 14,
          ), // ปรับขนาดฟอนต์ของ label
          border: OutlineInputBorder(),
          prefixIcon: Icon(icon),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ), // ลดขนาดของ padding ในช่องกรอกข้อมูล
        ),
        style: TextStyle(fontSize: 14), // ปรับขนาดฟอนต์ภายในช่องกรอกข้อมูล
      ),
    );
  }
}
