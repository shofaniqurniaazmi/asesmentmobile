import 'package:flutter/material.dart';

class FormDisplay extends StatelessWidget {
  final String? FullName;
  final String? Email;
  final int? PhoneNumber;
  final int? PersonalIDNumber;
  final String? Address;

  const FormDisplay({
    Key? key,
    this.FullName,
    this.Email,
    this.PhoneNumber,
    this.PersonalIDNumber,
    this.Address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Personal Data'),
      ),
      body: ListView.builder(
        itemCount: _getItemCount(),
        itemBuilder: (context, index) {
          return _buildListTile(index);
        },
      ),
    );
  }

  int _getItemCount() {
    int itemCount = 0;
    if (FullName != null) itemCount++;
    if (Email != null) itemCount++;
    if (PhoneNumber != null) itemCount++;
    if (PersonalIDNumber != null) itemCount++;
    if (Address != null) itemCount++;
    return itemCount;
  }

  Widget _buildListTile(int index) {
    switch (index) {
      case 0:
        return _buildListTileItem("Full Name", FullName);
      case 1:
        return _buildListTileItem("Email", Email);
      case 2:
        return _buildListTileItem("Phone Number", PhoneNumber.toString());
      case 3:
        return _buildListTileItem(
            "Personal ID Number", PersonalIDNumber.toString());
      case 4:
        return _buildListTileItem("Address", Address);
      default:
        return SizedBox.shrink();
    }
  }

  Widget _buildListTileItem(String label, String? value) {
    if (value != null) {
      return ListTile(
        title: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(value),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
