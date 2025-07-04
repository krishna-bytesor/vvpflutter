// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CountryDropdown extends StatefulWidget {
  const CountryDropdown({
    super.key,
    this.width,
    this.height,
    this.initialCode,
  });

  final double? width;
  final double? height;
  final String? initialCode;

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  @override
  final List<Map<String, String>> countries = [

    {'name': 'Global',
      'code': '', // or '+00', if you prefer


      'flag': 'https://img.icons8.com/ios-filled/50/000000/globe.png',
    },
    {
      'name': 'India',
      'code': '+91',
      'flag':
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-v-p-swami-scope-of-work-meq08e/assets/sp4dxugvx5nx/India.png'
    },
    {
      'name': 'United States',
      'code': '+1',
      'flag':
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-v-p-swami-scope-of-work-meq08e/assets/sz6srhz156qg/USA.png'
    },
    {
      'name': 'Australia',
      'code': '+61',
      'flag':
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-v-p-swami-scope-of-work-meq08e/assets/s18nxpu4lz0e/Australia.png'
    },
    {
      'name': 'New Zealand',
      'code': '+64',
      'flag':
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-v-p-swami-scope-of-work-meq08e/assets/bzm4gerwink7/new_zealand.png'
    },
    {
      'name': 'Thailand',
      'code': '+66',
      'flag':
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-v-p-swami-scope-of-work-meq08e/assets/lolzwlgzcekg/Flag_of_Thailand.svg.png'
    },
    // Add more countries as needed
  ];

  // Selected country
  Map<String, String>? selectedCountry;

  @override
  void initState() {
    super.initState();

    // Set the initial value based on the provided initial code
    if (widget.initialCode != null) {
      selectedCountry = countries.firstWhere(
        (country) => country['code'] == widget.initialCode,
        orElse: () =>
            countries.first, // Fallback to the first item if no match is found
      );
    }
  }

  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent, // Ensure the container is transparent
        ),
        child: DropdownButton<Map<String, String>>(
          // ─────────────────────────────────────────────────────────────
          // 1️⃣  This value stays null until the user taps a flag
          // ─────────────────────────────────────────────────────────────
          value: selectedCountry,

          // ─────────────────────────────────────────────────────────────
          // 2️⃣  What to show when `value == null`
          //     (-- i.e. on first load or if you clear the selection)
          // ─────────────────────────────────────────────────────────────
          hint: Icon(
            Icons.language, // 🌐 world / “global” icon
            size: 24, // pick any size you like
            color: const Color(0xFF232323),
          ),

          // ─────────────────────────────────────────────────────────────
          // 3️⃣  Same on-change callback you already had
          // ─────────────────────────────────────────────────────────────
          onChanged: (newValue) {
            setState(() {
              selectedCountry = newValue;
              FFAppState().CountryCode = newValue?['code'] ?? '';
            });
          },

          // ─────────────────────────────────────────────────────────────
          // 4️⃣  Your flag items (unchanged)
          // ─────────────────────────────────────────────────────────────
          items:
              countries.map<DropdownMenuItem<Map<String, String>>>((country) {
            return DropdownMenuItem<Map<String, String>>(
              value: country,
              child: Row(
                children: [
                  Image.network(
                    country['flag']!,
                    width: 36,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            );
          }).toList(),

          // visual tweaks you already had
          dropdownColor: const Color(0xFFFFFFFF),
          underline: Container(color: Colors.transparent),
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          iconEnabledColor: const Color(0xFFFF6260),
          style: const TextStyle(color: Colors.black),
          elevation: 0,
        ));
  }
}
