import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/home_page/more_page/contact_us_page/contact_us_page_components/call_us_option.dart';
import 'package:green_egypt/screens/home_page/more_page/contact_us_page/contact_us_page_components/chat_option.dart';
import 'package:green_egypt/screens/home_page/more_page/contact_us_page/contact_us_page_components/contact_us_page_header.dart';
import 'package:green_egypt/screens/home_page/more_page/contact_us_page/contact_us_page_components/email_us_option.dart';
import 'package:green_egypt/screens/home_page/more_page/contact_us_page/contact_us_page_components/message_text_field.dart';
import 'package:green_egypt/screens/home_page/more_page/contact_us_page/contact_us_page_components/or_divider_line.dart';
import 'package:green_egypt/screens/home_page/more_page/contact_us_page/contact_us_page_components/send_message_button.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: Dimensions.height, // تمليء الشاشه بالكامل
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ContactUsPageHeader(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [CallUsOption(), EmailUsOption(), ChatOption()],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const OrDividerLine(),
                Container(
                  alignment: Alignment.center,
                  height: 350,
                  width: Dimensions.width,
                  decoration: const BoxDecoration(),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      MessageTextField(),
                      SendMessageButton()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
