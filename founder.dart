import 'package:flutter/material.dart';

class AppDatabase {
  static const String founderName = 'المهندس عمر العبيدي';
  static const String founderContact = '07801727594';
}

class FounderInfoWidget extends StatelessWidget {
  const FounderInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('تطوير وإدارة', style: TextStyle(fontSize: 11, color: Colors.white70)),
          SizedBox(height: 2),
          Text(
            AppDatabase.founderName,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
          SizedBox(height: 2),
          Text(
            AppDatabase.founderContact,
            style: TextStyle(fontSize: 12, color: Colors.white60),
          ),
        ],
      ),
    );
  }
}