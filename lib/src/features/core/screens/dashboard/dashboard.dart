import 'package:flutter/material.dart';
import 'package:misafu/src/constants/assets_strings.dart';
import 'package:misafu/src/constants/colors.dart';
import 'package:misafu/src/constants/text_strings.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          cAppName,
          style:
              Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: cCardBgColor),
            child: IconButton(onPressed: (){}, icon: const Image(image: AssetImage(cUserProfileImage),),),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cDashboardTitle, style: txtTheme.bodyMedium,),
              Text(cDashboardHeading, style: txtTheme.headlineSmall,),
              const SizedBox(height: 10,),
              Container(
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide(width: 4)),

                ),
                child: Row(
                  children: [
                    Text(cDashboardSearch, style: txtTheme.headlineSmall?.apply(color: Colors.grey.withOpacity(0.5)),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
