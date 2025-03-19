import 'package:flutter/material.dart';

class SalaryPayroll extends StatelessWidget {
  const SalaryPayroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary Payroll'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/expense-form'); // Navigate to ExpenseForm
          },
          child: const Text('Open Expense Form'),
        ),
      ),
    );
  }
}
