import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ExpenseForm extends StatefulWidget {
  @override
  _ExpenseFormState createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _receiptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Form'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 4,
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Submit New Expense Heading
                Text(
                  'Submit New Expense',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 20),

                // Amount and Category Row
                Row(
                  children: [
                    // Amount Field
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Amount (₹)'),
                          SizedBox(height: 6),
                          _buildInputBox(
                            controller: _amountController,
                            hintText: '0.0',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),

                    // Category Field
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Category'),
                          SizedBox(height: 6),
                          _buildInputBox(
                            controller: _categoryController,
                            hintText: 'Travels, meals',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Description Field (Increased Height)
                Text('Description'),
                SizedBox(height: 6),
                _buildInputBox(
                  controller: _descriptionController,
                  hintText: 'Provide details',
                  maxLines: 5, // Increased height
                ),
                SizedBox(height: 16),

                // Upload Receipt Field (Same Height as Description)
                Text('Upload Receipt'),
                SizedBox(height: 6),
                _buildUploadBox(), // New upload box
                SizedBox(height: 24),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Submit logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      'Submit Expense',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Input Box Builder
  Widget _buildInputBox({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[100], // Soothing grey
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[200]!),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
            width: 2.0, // Increased thickness of the border
          ),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }


  // Upload Box with Icon
  Widget _buildUploadBox() {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          String fileName = result.files.single.name;
          setState(() {
            _receiptController.text = fileName; // Show file name in the field
          });
        }
      },
      child: Container(
        height: 120,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                size: 36,
                color: Colors.teal,
              ),
              SizedBox(height: 8),
              Text(
                _receiptController.text.isEmpty
                    ? 'Upload Receipt'
                    : _receiptController.text, // Show selected file name
                style: TextStyle(color: Colors.grey[600]),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis, // In case file name is too long
              ),
            ],
          ),
        ),
      ),
    );
  }
}