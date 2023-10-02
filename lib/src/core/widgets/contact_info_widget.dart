import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({
    Key? key,
    this.contactInfo,
    required this.schema,
  }) : super(key: key);

  final String? contactInfo;
  final String schema;

  @override
  Widget build(BuildContext context) {
    return contactInfo != null && contactInfo!.isNotEmpty
        ? GestureDetector(
            onTap: () {
              final uri = Uri(
                scheme: schema,
                path: contactInfo,
              );
              launchUrl(
                uri,
              );
            },
            child: Text(
              contactInfo!,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
