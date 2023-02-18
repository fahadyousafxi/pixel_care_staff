import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Terms And Condition'),
      ),
      body: Column(
        children: [
          Text('Introduction and Overview'),
          Container(
            height: 650.h,
            child: SfPdfViewer.asset(
                'assets/images/Agreement/Terms.pdf'),
          ),

        ],
      ),

    );
  }
}
