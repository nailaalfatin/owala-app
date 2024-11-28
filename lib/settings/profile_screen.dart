import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart'; // Import this for date formatting

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('assets/profile_image.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt, color: Colors.white),
                          onPressed: () {
                            //logic buat ngasih profile picture
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const TextFieldWidget(
                label: 'Full Name',
                initialValue: 'Naila Al Fatin',
              ),
              const SizedBox(height: 16),
              const TextFieldWidget(
                label: 'Email Address',
                initialValue: 'nailaalfatin@gmail.com',
              ),
              const SizedBox(height: 16),
              const PhoneNumberFieldWidget(),
              const SizedBox(height: 16),
              const DateFieldWidget(label: 'Date of Birth'),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Saved',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
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
}

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String initialValue;

  const TextFieldWidget({
    super.key,
    required this.label,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
        ),
      ],
    );
  }
}

class PhoneNumberFieldWidget extends StatelessWidget {
  const PhoneNumberFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phone Number', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 8),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: '+62', child: Text('+62')),
                  DropdownMenuItem(value: '+1', child: Text('+1')),
                  // Add other country codes as needed
                ],
                onChanged: (value) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                ),
                hint: const Text('Code'),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              flex: 3,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Your phone number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DateFieldWidget extends StatefulWidget {
  final String label;

  const DateFieldWidget({super.key, required this.label});

  @override
  // ignore: library_private_types_in_public_api
  _DateFieldWidgetState createState() => _DateFieldWidgetState();
}

class _DateFieldWidgetState extends State<DateFieldWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 8),
        TextFormField(
          controller: _controller,
          readOnly: true, // Make the text field read-only
          decoration: InputDecoration(
            hintText: 'Select your date of birth',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () {
                _selectDate(context);
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), // Set your own constraints
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      // Format the date and update the text fieldb
      setState(() {
        _controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }
}
