# 🚗 Car Rental App  

A **Flutter**-powered car rental application designed for a seamless and luxurious vehicle booking experience. Users can explore, search, and rent premium cars, including **Tesla, BMW, Audi, and Mercedes**, with intuitive navigation, authentication, and real-time data management via **Firebase**.  

---

## 📌 Key Features  

🚀 **User Authentication** (Sign Up, Login, Logout via Firebase)  
🚗 **Home Screen** with categorized car listings (Tesla, BMW, Audi, Mercedes)  
🔍 **Advanced Search** with real-time filtering  
❤️ **Favorites** to save preferred vehicles  
👤 **User Profile Management** with Firebase-stored details  
🔔 **Notifications** for alerts and promotions  
🛠 **Dynamic Navigation Bar** for intuitive screen switching  
📋 **Detailed Car Pages** with specifications, pricing, and a booking option  
🖥 **Dedicated Tesla, BMW, Audi, and Mercedes screens** for a premium experience  

---

## 🛠️ Technologies Used  

- **Flutter (Dart)** for UI and state management  
- **Firebase Authentication** (Email/Password Login)  
- **Cloud Firestore** for real-time data storage  
- **Provider** for efficient state management  
- **Hero Animations** for smooth UI transitions  

---

## 🔧 Installation & Setup  

### 1️⃣ Prerequisites  
- Install Flutter SDK (`flutter doctor` to verify setup)  
- Create a Firebase project and configure authentication  
- Download `google-services.json` and place it in `android/app/`  

### 2️⃣ Clone the Repository  
```bash
git clone https://github.com/yourusername/car_rental_app.git
cd car_rental_app
```

### 3️⃣ Install Dependencies  
```bash
flutter pub get
```

### 4️⃣ Run the App  
```bash
flutter run
```

---

## 🔥 Firebase Setup  

1. Create a Firebase Project at [Firebase Console](https://console.firebase.google.com/)  
2. Enable Authentication (Email & Password)  
3. Configure Firestore Database with the following structure:  

---

## 📝 Firestore Database Structure  
```
users (Collection)
 ├── userId (Document)
 │     ├── name: "John Doe"
 │     ├── email: "johndoe@example.com"
 │     ├── contact: "+1234567890"

cars (Collection)
 ├── carId (Document)
 │     ├── name: "Tesla Model S"
 │     ├── brand: "Tesla"
 │     ├── price: 120.0
 │     ├── image: "assets/images/tesla_model_s.png"
 │     ├── rating: 4.8
```

---

## 📂 Folder Structure  
```
CAR_RENTAL_APP
│-- android/
│-- ios/
│-- lib/
│   │-- home_screen.dart
│   │-- login_screen.dart
│   │-- signup_screen.dart
│   │-- profile_screen.dart
│   │-- favorites_screen.dart
│   │-- search_screen.dart
│   │-- notification_screen.dart
│   │-- car_detail_screen.dart
│   │-- tesla_screen.dart
│   │-- bmw_screen.dart
│   │-- mercedes_screen.dart
│   │-- audi_screen.dart
│   │-- models/
│   │   │-- car_model.dart
│   │-- services/
│   │   │-- auth_service.dart
│   │-- helpers/
│   │   │-- db_helper.dart
│   │-- main.dart
│-- assets/
│-- pubspec.yaml
│-- README.md
```

---

## ⚡ API & Services Used  

- **Firebase Authentication** for secure user login/signup  
- **Firestore Database** for real-time car listings and user data  
- **Flutter UI Widgets** for a responsive, intuitive interface  

---

## 👥 Contributors  
- **Jarrar Shahid**  

---

## 📜 License  
This project is open-source and available under the MIT License.  

---

## 💬 Contact  
📧 Email: jarrarshahid@gmail.com  
