# TrafficLly - Islamabad Traffic Management App 🚨

![TrafficLly](https://img.shields.io/badge/Flutter-3.19-blue?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.2-blue?style=for-the-badge&logo=dart)
![GetX](https://img.shields.io/badge/GetX-4.6-green?style=for-the-badge)

A comprehensive **Flutter** application for managing and analyzing traffic challan and driving license data for **Islamabad Police**. It provides **real-time analytics** and management tools for enforcement personnel.

---

## 🚀 Key Features

* **Challan Management**: Track paid/unpaid challan amounts and trends with interactive charts.
* **Driving License Analytics**: Monitor DL fee collections and learner application status.
* **Modern UI/UX**: Responsive design, smooth animations, and consistent custom theme.
* **Time Filtering**: View data filtered by Daily, Weekly, Monthly, and Yearly periods.

---

## 🛠 Technical Stack

* **Framework**: **Flutter 3.19+**
* **State Management**: **GetX 4.6+** for reactive data handling.
* **Data Visualization**: `fl_chart` for all interactive graphs.
* **HTTP Client**: Dart `http` with `IOClient` for secure network communication.

---

## 🔌 API Integration

This application relies entirely on **official backend services** to fetch real-time data for both challans and driving licenses. These services are the **sole source** for the statistics and aggregated information displayed in the app's dashboard and analytics screens.

| Data Type | Purpose of Integration |
| :--- | :--- |
| **Challan Data** | Provides aggregate figures (total, paid, unpaid amounts/tickets) for enforcement analysis. |
| **DL Data** | Provides aggregate statistics on driving license applications, fees, and learner status. |

---

## 🚀 Installation

### Prerequisites
* Flutter SDK **3.19+**
* Dart **3.2+**

### Steps
1.  Clone the repository: `git clone [repository-url]`
2.  Install dependencies: `flutter pub get`
3.  Run the application: `flutter run`

---

## 📄 License

This project is **proprietary** and developed for **Islamabad Police**.

---

**Built with ❤️ for Islamabad Police**
