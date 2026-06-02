import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'glass_card.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _subject = TextEditingController();
  final _message = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _subject.dispose();
    _message.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message ready to send')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) => (value == null || value.isEmpty) ? 'Enter your name' : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _email,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) => (value == null || value.isEmpty) ? 'Enter your email' : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _subject,
              decoration: const InputDecoration(labelText: 'Subject'),
              validator: (value) => (value == null || value.isEmpty) ? 'Enter subject' : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _message,
              minLines: 5,
              maxLines: 8,
              decoration: const InputDecoration(labelText: 'Message'),
              validator: (value) => (value == null || value.isEmpty) ? 'Enter message' : null,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submit,
                child: const Text('Send Message'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
