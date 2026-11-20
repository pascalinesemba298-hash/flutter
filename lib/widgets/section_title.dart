import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {

  final String title;
  final String? subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.only(
        top: 22,
        bottom: 12,
      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(
            title,

            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF101B32),
            ),
          ),

          if (subtitle != null) ...[

            const SizedBox(height: 4),

            Text(
              subtitle!,
              style: TextStyle(
                color: Colors.blueGrey.shade500,
              ),
            ),

          ],

        ],

      ),

    );

  }

}