import 'package:easy_hire/pages/plumbing_page.dart';
import 'package:easy_hire/widgets/address_panel.dart';
import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:easy_hire/widgets/custom_radio.dart';
import 'package:easy_hire/widgets/custom_text_field.dart';
import 'package:easy_hire/widgets/huge_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HandymanServicePage extends StatefulWidget {
  @override
  _HandymanServicePageState createState() => _HandymanServicePageState();
}

class _HandymanServicePageState extends State<HandymanServicePage> {
  int _radioValue = 0;
  String descriptionText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Handyman service"),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Location",
                        style: GoogleFonts.montserrat(
                            fontSize: 19,
                            color: Color(0xFF252525),
                            letterSpacing: 0.38,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    AddressPanel(
                      addressName: "Add address",
                    ),
                    SizedBox(height: 16),
                    Text("When to start",
                        style: GoogleFonts.montserrat(
                            fontSize: 19,
                            color: Color(0xFF252525),
                            letterSpacing: 0.38,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    CustomRadio(
                        value: 0,
                        groupValue: _radioValue,
                        title: "Now",
                        onTap: () {
                          setState(() {
                            _radioValue = 0;
                          });
                        }),
                    SizedBox(height: 16),
                    CustomRadio(
                      title: "Choose a date",
                      value: 1,
                      groupValue: _radioValue,
                      onTap: () {
                        setState(() {
                          _radioValue = 1;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                            child: CustomTextField(
                          hintText: "Add date",
                        )),
                        SizedBox(width: 8),
                        Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFF4F4F4),
                            ),
                            padding: EdgeInsets.all(13),
                            child: Icon(Icons.calendar_today),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Text("Description",
                        style: GoogleFonts.montserrat(
                            fontSize: 19,
                            color: Color(0xFF252525),
                            letterSpacing: 0.38,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    HugeTextField(
                      hintText: "Add description",
                      text: descriptionText,
                      onChanged: (value) {
                        setState(() {
                            descriptionText = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: CustomButton(
              title: r"Pay 200$",
              isActive: true,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlumbingPage()));
              },
            ),
          )
        ],
      ),
    );
  }
}
