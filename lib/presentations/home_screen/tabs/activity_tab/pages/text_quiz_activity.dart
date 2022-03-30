import 'package:flutter/material.dart';
import 'package:ranger_park/models/park_details.dart';
import 'package:ranger_park/models/question_model.dart';

class IdentifyMammal extends StatefulWidget {
  final QuestionModel data;
  final ParkDetails? parkData;

  IdentifyMammal({required this.data, required this.parkData});

  @override
  State<IdentifyMammal> createState() => _IdentifyMammalState();
}

class _IdentifyMammalState extends State<IdentifyMammal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.red,
    );
  }
}
