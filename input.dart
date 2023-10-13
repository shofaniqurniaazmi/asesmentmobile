import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  const FormInput({Key? key}) : super(key: key);
  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final _FullNameTextboxController = TextEditingController();
  final _EmailTextboxController = TextEditingController();
  final _PhoneNumberTextboxController = TextEditingController();
  final _PersonalIDNumberTextboxController = TextEditingController();
  final _AddressTextboxController = TextEditingController();
  final _verifyController = TextEditingController();
  bool _isChecked = false;
  DateTime _selectedDate = DateTime.now();
  List<String> dataList = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'PERSONAL FORM',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.list,
              color: Colors.black, // Ganti dengan warna yang Anda inginkan
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Display(dataList: dataList),
              ));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildFormBox(_textboxFullName(), "Full Name"),
            _buildFormBox(_textboxEmail(), "Email"),
            _buildFormBox(_textboxPhoneNumber(), "Phone Number"),
            _buildFormBox(_textboxVerify(), "Verify"),
            _buildFormBox(_textboxPersonalIDNumber(), "Personal ID Number"),
            _buildFormBox(_textboxAddress(), "Address"),
            _buildFormBox(_buildDatePickerButton(), "Choose a Date"),
            _buildFormBox(_buildCheckBox(), "Checklist"),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildFormBox(Widget child, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.black),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _textboxFullName() {
    return TextField(
      controller: _FullNameTextboxController,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }

  Widget _textboxEmail() {
    return TextField(
      controller: _EmailTextboxController,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }

  Widget _textboxVerify() {
    return TextField(
      controller: _verifyController,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }

  Widget _textboxPhoneNumber() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _PhoneNumberTextboxController,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Contoh: Ketika tombol Verify ditekan, isi kolom Verify dengan "Verified".
            _verifyController.text = "Verified";
          },
          child: Text('Verify'),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(15)),
          ),
        ),
      ],
    );
  }

  Widget _textboxPersonalIDNumber() {
    return TextField(
      controller: _PersonalIDNumberTextboxController,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }

  Widget _textboxAddress() {
    return TextField(
      controller: _AddressTextboxController,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }

  Widget _buildDatePickerButton() {
    return Row(
      children: [
        TextButton(
          onPressed: () => _selectDate(context),
          child: Text('Choose a Date'),
        ),
        SizedBox(width: 10),
        Text(
          'Selected Date: ${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
          style: TextStyle(color: Color(0xff0d5d83)),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          String FullName = _FullNameTextboxController.text;
          String Email = _EmailTextboxController.text;
          String PhoneNumber = _PhoneNumberTextboxController.text;
          String PersonalIDNumber = _PersonalIDNumberTextboxController.text;
          String Address = _AddressTextboxController.text;

          dataList.add('Full Name: $FullName');
          dataList.add('Email: $Email');
          dataList.add('Phone Number: $PhoneNumber');
          dataList.add('Personal ID Number: $PersonalIDNumber');
          dataList.add('Address: $Address');

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Display(dataList: dataList),
          ));
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
          padding: MaterialStateProperty.all(EdgeInsets.all(15)),
        ),
        child: const Text('Submit'),
      ),
    );
  }

  Widget _buildCheckBox() {
    return Row(
      children: <Widget>[
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        Flexible(
          child: Text(
            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class Display extends StatefulWidget {
  final List<String> dataList;

  const Display({Key? key, required this.dataList}) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Personal Data'),
      ),
      body: ListView.builder(
        itemCount: widget.dataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.dataList[index]),
          );
        },
      ),
    );
  }
}
