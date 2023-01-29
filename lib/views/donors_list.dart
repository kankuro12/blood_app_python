import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:blood_app/utils/helper/global_functions.dart';
import 'package:blood_app/utils/widgets/dash_container.dart';
import 'package:flutter/material.dart';

import '../utils/constants/export.dart';

class DonorListScreen extends StatelessWidget {
  const DonorListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: const Text(
          "Donors List",
        ),
        centerTitle: true,
        titleTextStyle: AppStyle.headingStyle(color: AppColor.darkPrimary),
        iconTheme: const IconThemeData(color: AppColor.darkPrimary),
      ),
      body: SingleChildScrollView(
        child: Column(children: const [
          DonorTile(
            donorName: "Someone Someone",
            bloodType: "A+",
            address: "Biratnagar-12",
            phoneNumber: "9801234567",
            email: "shrijalshrestha313@gmail.com",
          ),
        ]).pa(10),
      ),
    );
  }
}

class DonorTile extends StatelessWidget {
  const DonorTile({
    Key? key,
    required this.donorName,
    required this.bloodType,
    required this.address,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  final String donorName;
  final String bloodType;
  final String address;
  final String email;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return DashContainer(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      donorName,
                      style: AppStyle.headingStyle(),
                    ).p(5),
                    Text.rich(
                      TextSpan(
                        text: 'Address:', // default text style
                        style: AppStyle.regularStyle(),
                        children: <TextSpan>[
                          TextSpan(text: address, style: AppStyle.semiBold()),
                        ],
                      ),
                    ).p(5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Email: ', // default text style
                            style: AppStyle.regularStyle(),
                            children: <TextSpan>[
                              TextSpan(text: email, style: AppStyle.semiBold()),
                            ],
                          ),
                        ),
                        Tooltip(
                          message: "Press to mail",
                          child: GestureDetector(
                            onTap: () {
                              launchInEmail(email);
                              print("pressed mail");
                            },
                            child: const Icon(
                              Icons.mail,
                              color: AppColor.green1,
                              size: 16,
                            ),
                          ),
                        )
                      ],
                    ).p(5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Contact: ', // default text style
                            style: AppStyle.regularStyle(),
                            children: <TextSpan>[
                              TextSpan(
                                  text: phoneNumber,
                                  style: AppStyle.semiBold()),
                            ],
                          ),
                        ),
                        Tooltip(
                          message: "Press to Call",
                          child: GestureDetector(
                            onTap: () {
                              launchInCall(phoneNumber);
                              print("pressed dial");
                            },
                            child: const Icon(
                              Icons.call,
                              color: AppColor.green1,
                              size: 16,
                            ),
                          ),
                        )
                      ],
                    ).p(5),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Blood Type",
                      style: AppStyle.regularStyle(),
                    ),
                    Text(
                      bloodType,
                      style: AppStyle.headingStyle(
                          color: AppColor.darkPrimary, fontSize: 30),
                    ),
                    // Text.rich(
                    //   TextSpan(
                    //     text: "${amount ?? "N/A"}", // default text style
                    //     style: AppStyle.semiBold(),

                    //     children: <TextSpan>[
                    //       // TextSpan(
                    //       //   text: '2',
                    //       //   style: StyleManager.semiBold(),
                    //       // ),
                    //       TextSpan(
                    //         text: '(in Pint)',
                    //         style: AppStyle.subLightStyle(),
                    //       ),
                    //     ],
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ).p(5),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [],
          ),
        ],
      ),
    );
  }
}
