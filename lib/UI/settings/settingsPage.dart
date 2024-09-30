import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tollo_on_flutter/Providers/Theme_Provider.dart';
import 'package:tollo_on_flutter/Providers/auth_provider.dart';
import 'package:tollo_on_flutter/shared/appstyle.dart';
import 'package:tollo_on_flutter/shared/RoundedIconHorizontal.dart';
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  File? _image;

  Future<void> _pickImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          // Convert the path to a File instance
          _image = File(image.path);
        });

        // Update the user's profile picture using the path
        final authNotifier = ref.read(authNotifierProvider.notifier);
        authNotifier.updateUserPhotoUrl(_image!);

      } else {
        print("Image picking was canceled.");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.watch(authNotifierProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.replace('/homepage');
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Center(
                child: Text(
                  'ACCOUNT',
                  style: appstyle(20, Theme.of(context).colorScheme.primary, FontWeight.w600),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : (authNotifier.userPhotoUrl != null
                          ? NetworkImage(authNotifier.userPhotoUrl!)
                          : const AssetImage('assets/images/tollopay.png')) as ImageProvider,
                    ),
                    const SizedBox(width: 15.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          authNotifier.userDisplayName ?? 'User',
                          style: appstyle(20, Theme.of(context).colorScheme.secondary, FontWeight.normal),
                        ),
                        Text(
                          '+254722260688',
                          style: appstyle(20, Theme.of(context).colorScheme.primary, FontWeight.w700),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    OutlinedButton(
                      onPressed: _pickImage,
                      child: Text(
                        'EDIT PICTURE',
                        style: appstyle(12, Theme.of(context).colorScheme.secondary, FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Settings',
                  style: appstyle(15, Theme.of(context).colorScheme.secondary, FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}