# 📸 Flutter Camera App
## ตัวอย่างเมื่อรันได้

![image](https://github.com/user-attachments/assets/dcf7c60a-0246-47ab-b6ce-2fd4fb0cd2e5)


## 🚀 เริ่มต้นการใช้งาน
แอปนี้เป็น Flutter Camera ที่ช่วยให้คุณสามารถ **ถ่ายภาพ** และ **ดูแกลเลอรี** ได้ง่าย ๆ โดยใช้ **Flutter + Image Picker**

---

## ✅ **การติดตั้ง Flutter**
หากยังไม่มี Flutter สามารถติดตั้งตามลิงก์นี้ได้: [Flutter Installation](https://flutter.dev/docs/get-started/install)

**ตรวจสอบว่า Flutter ติดตั้งสมบูรณ์หรือไม่:**
```sh
flutter doctor
```
หากมีปัญหาเกี่ยวกับ `Android SDK` หรือ `cmdline-tools` ให้ทำตามคำแนะนำที่ `flutter doctor` แจ้งมาเพื่อแก้ไข

---

## 🔧 **การติดตั้งโปรเจกต์**
### **1️⃣ โคลนโปรเจกต์จาก GitHub**
```sh
git clone https://github.com/your-repo/flutter_camera.git
cd flutter_camera
```

### **2️⃣ ติดตั้ง Dependencies**
```sh
flutter pub get
```
ตรวจสอบว่าแพ็กเกจใน `pubspec.yaml` เป็นเวอร์ชันล่าสุดหรือไม่:
```sh
flutter pub outdated
flutter pub upgrade
```

### **3️⃣ รันโปรเจกต์**
```sh
flutter run
```
> **หมายเหตุ:** หากใช้ Emulator ต้องเปิดจาก Android Studio หรือใช้คำสั่ง
```sh
flutter emulators --launch <ชื่ออีมูเลเตอร์>
```

---

## 📂 **โครงสร้างโปรเจกต์**
```
flutter_camera/
 ├── lib/
 │   ├── main.dart          # ไฟล์หลักของแอป
 │   ├── camera_page.dart   # หน้าถ่ายรูป
 │   ├── gallery_page.dart  # หน้าแสดงรูปภาพ
 │
 ├── android/               # ไฟล์สำหรับ Android
 ├── ios/                   # ไฟล์สำหรับ iOS
 ├── pubspec.yaml           # รายการ dependencies
 ├── README.md              # คำแนะนำการใช้งาน
```

---

## 📌 **การใช้งาน**
### 📷 **หน้า Camera**
1. กดปุ่ม **📸 ถ่ายรูป** เพื่อเปิดกล้อง
2. ระบบจะบันทึกรูปและแสดงบนหน้าจอ
3. กดที่รูปเพื่อดูขนาดเต็ม

### 🖼 **หน้า Gallery**
1. เมื่อเปิดหน้า Gallery ระบบจะแสดงรูปที่ถ่ายไว้
2. สามารถกดที่รูปเพื่อดูภาพขนาดเต็มได้

---

## 🛠 **Dependencies ที่ใช้**
```yaml
dependencies:
  flutter:
    sdk: flutter
  image_picker: ^1.0.4
  permission_handler: ^11.0.1
  google_fonts: ^6.1.0
  animate_do: ^3.0.2
```
> **หมายเหตุ:** หากรันแล้วเจอปัญหา ให้ตรวจสอบเวอร์ชันของ `image_picker` และ `permission_handler` ว่าเป็นเวอร์ชันล่าสุดหรือไม่

---

## 🎯 **ปัญหาที่พบบ่อย (FAQ)**
### ❌ **Gradle build failed**
ลองรันคำสั่งนี้เพื่อเคลียร์แคช:
```sh
flutter clean
flutter pub get
```

### ❌ **ติดตั้ง `cmdline-tools` ไม่ได้**
```sh
sdkmanager --install "cmdline-tools;latest"
```

### ❌ **ปัญหา `flutter doctor --android-licenses` ไม่ผ่าน**
```sh
flutter doctor --android-licenses
```
