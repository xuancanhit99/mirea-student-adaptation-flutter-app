import 'package:flutter/material.dart';

import '../../../../../constants/assets_strings.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/text_strings.dart';

class DashboardBanners extends StatelessWidget {
  const DashboardBanners({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cCardBgColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Flexible(child: Icon(Icons.bookmark)),
                    Flexible(
                        child:
                        Image(image: AssetImage(cBannerImage1))),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  cDashboardBannerTitle1,
                  style:
                  txtTheme.headlineSmall?.copyWith(fontSize: 20),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  cDashboardBannerSubTitle,
                  style: txtTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cCardBgColor),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Flexible(child: Icon(Icons.bookmark)),
                          Flexible(
                              child: Image(
                                  image: AssetImage(cBannerImage2))),
                        ],
                      ),
                      Text(
                        cDashboardBannerTitle2,
                        style: txtTheme.headlineSmall
                            ?.copyWith(fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        cDashboardBannerSubTitle,
                        style: txtTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text(cViewAll)))
              ],
            ))
      ],
    );
  }
}