import 'package:flutter/material.dart';
import 'package:medhirappv1/screens/notification.dart';
import 'package:medhirappv1/screens/employee_dashboard.dart';
import 'package:medhirappv1/screens/expense_form.dart'; // Import ExpenseForm

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
        useMaterial3: true,
      ),
      home: const EmployeeDashboard(), // Set SalaryPayroll as home
    );
  }
}