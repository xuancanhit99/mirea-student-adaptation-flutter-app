import 'package:flutter/material.dart';

import '../../../../../constants/assets_strings.dart';
import '../../../../../constants/colors.dart';


class DashboardTopCourses extends StatelessWidget {
  const DashboardTopCourses({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cCardBgColor),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Java Crash Course",
                            style: txtTheme.headlineSmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Flexible(
                            child: Image(
                              image: AssetImage(cTopCourseImage1),
                              height: 110,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder()),
                            child: const Icon(Icons.play_arrow)),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              "3 Sections",
                              style: txtTheme.headlineSmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "Programming Languages",
                              style: txtTheme.bodySmall,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cCardBgColor),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Java Crash Course",
                            style: txtTheme.headlineSmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Flexible(
                            child: Image(
                              image: AssetImage(cTopCourseImage1),
                              height: 110,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder()),
                            child: const Icon(Icons.play_arrow)),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              "3 Sections",
                              style: txtTheme.headlineSmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "Programming Languages",
                              style: txtTheme.bodySmall,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cCardBgColor),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Java Crash Course",
                            style: txtTheme.headlineSmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Flexible(
                            child: Image(
                              image: AssetImage(cTopCourseImage1),
                              height: 110,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder()),
                            child: const Icon(Icons.play_arrow)),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              "3 Sections",
                              style: txtTheme.headlineSmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "Programming Languages",
                              style: txtTheme.bodySmall,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}