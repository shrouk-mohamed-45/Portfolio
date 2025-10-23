//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portofolio/core/uitls/app_colors.dart';
import 'package:portofolio/core/uitls/image_manager.dart';
import 'package:portofolio/features/portfolio/data/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not Open $url';
    }
  }

  final List<ProjectModel> mobileProjects = [
    ProjectModel(
      title: "Inventory Management App",
      image: ImageManager.inventoryApp,
      description:
          "Features include creating warehouses with assigned employees and products, managing shipments, and tracking expenses for each shipment.",
    ),
    ProjectModel(
      title: "Montaza App",
      image: ImageManager.montazaApp,
      description:
          "A ticket booking and access management system for Montaza Park in Alexandria.",
    ),
    ProjectModel(
      title: "Quran App",
      image: ImageManager.quranApp,
      description:
          "Flutter app to display the surahs and verses of the Holy Quran with easy browsing and searching capabilities. ",
    ),
  ];
  final List<ProjectModel> workAndExperience = [
    ProjectModel(
      title: "VotechX",
      image: ImageManager.exApp,
      description: "Flutter Developer\n Dec 2024 – Present.",
    ),
    ProjectModel(
      title: "Icore Soft",
      image: ImageManager.exApp,
      description: "Flutter Developer\n Apr 2025 – Jun 2025",
    ),
    ProjectModel(
      title: "Codratech",
      image: ImageManager.exApp,
      description: "Flutter Developer\n Mar 2024 – Oct 2024.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor.withOpacity(0.1),
        leading: Image.asset(
          ImageManager.logo,
        ),
        actions: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
                onTap: () {
                  _launchUrl(
                      'https://docs.google.com/document/d/1sGkibjErQ6W6IkNM6TWhjJddKn3qPkgmHTVipecgQUw/edit?usp=sharing');
                },
                borderRadius: BorderRadius.circular(8),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Text(
                    "Resume",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 18.w,
          right: 18.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                      height: (screenHeight * 0.9).clamp(100, 180),
                      width: (screenWidth * 0.9).clamp(100, 180),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.9),
                            blurRadius: 25,
                            spreadRadius: 5,
                          ),
                          BoxShadow(
                            color: AppColors.secondaryColor.withOpacity(0.3),
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                          BoxShadow(
                            color: AppColors.primaryColor.withOpacity(0.2),
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: ClipOval(
                            child: Image.asset(
                          ImageManager.me,
                          height: (screenHeight * 0.9).clamp(100, 180),
                          width: (screenWidth * 0.9).clamp(100, 180),
                          fit: BoxFit.cover,
                        )),
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Text(
                      "Hello! I'm \nShrouk Mohamed",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp.clamp(12.sp, 23.sp),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "I'm a Software Engineer.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.sp.clamp(19.sp, 20.sp),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Flutter Developer with 1+ years of hands-on experience in designing "
                "and developing complete mobile applications. "
                "Proficient in building scalable, maintainable, and "
                "clean architectures using Flutter and Dart, following best practices "
                "\n(Clean Code & Layered Architecture).Experienced in implementing Authentication"
                " flows and integrating complex RESTful APIs. "
                "\nSkilled in state management with Cubit, version control with Git "
                "(daily push/pull & branching), and debugging/testing to ensure "
                "high-quality applications.\nDelivered projects with 50+ screens, "
                "including role-based apps (Admin & Worker) with attractive and innovative UI designs."
                " \nA collaborative team player, eager to take on challenging opportunities"
                " and contribute to impactful digital solutions.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp.clamp(6.sp, 19.sp),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Work Experience",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.sp.clamp(8.sp, 20.sp),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: workAndExperience.length,
                  itemBuilder: (context, index) {
                    final work = workAndExperience[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              // AppColors.primaryColor,
                              // AppColors.primaryColor,
                              AppColors.secondaryColor,
                              AppColors.secondaryColor,
                              Colors.white.withOpacity(0.3),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            spacing: 10.w,
                            runSpacing: 10.h,
                            children: [
                              Image.asset(
                                work.image,
                                height: (screenHeight * 0.14).clamp(70, 160),
                                width: (screenWidth * 0.4).clamp(90, 180),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height:
                                        (screenHeight * 0.02).clamp(10, 130),
                                  ),
                                  Text(
                                    work.title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19.sp.clamp(19.sp, 20.sp),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    work.description,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp.clamp(16.sp, 20.sp),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Skills & Expertise",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.sp.clamp(8.sp, 19.sp),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        ImageManager.cPlusPlusLanguage,
                        width: (screenWidth * 0.14).clamp(20, 70),
                        height: (screenHeight * 0.14).clamp(20, 70),
                        // height: 130.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    ClipOval(
                      child: Image.asset(
                        ImageManager.dartLanguage,
                        width: (screenWidth * 0.14).clamp(20, 70),
                        height: (screenHeight * 0.14).clamp(20, 70),
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    ClipOval(
                      child: Image.asset(
                        ImageManager.cubit,
                        width: (screenWidth * 0.14).clamp(20, 70),
                        height: (screenHeight * 0.14).clamp(20, 70),
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    ClipOval(
                      child: Image.asset(
                        ImageManager.flutterFrameWork,
                        width: (screenWidth * 0.14).clamp(20, 70),
                        height: (screenHeight * 0.14).clamp(20, 70),
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: const AssetImage(
                        ImageManager.gitHub,
                      ),
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Mobile Projects",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.sp.clamp(8.sp, 19.sp),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              ListView.builder(
                  itemCount: mobileProjects.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final project = mobileProjects[index];
                    return SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Container(
                              height: (screenHeight * 0.1).clamp(180, 260),
                              width: (screenWidth * 0.53).clamp(160, 260),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image.asset(
                                project.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Column(
                              children: [
                                Text(
                                  project.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.sp.clamp(8.sp, 19.sp),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Container(
                                  width: 200.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white.withOpacity(0.3),
                                        AppColors.primaryColor,
                                        //AppColors.secondaryColor,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      project.description,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp.clamp(8.sp, 15.sp),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Contact Me",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.sp.clamp(8.sp, 19.sp),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "If you have any questions or would like to work together, feel free to get in touch!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp.clamp(7.sp, 19.sp),
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.phone, color: Colors.white),
                    onPressed: () {
                      _launchUrl('tel:+201211611162');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.email_outlined, color: Colors.white),
                    onPressed: () {
                      _launchUrl(
                          'mailto:shroukmz123@gmail.com?subject=Hello&body=I want to connect');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.link, color: Colors.white),
                    onPressed: () {
                      _launchUrl(
                          'https://www.linkedin.com/in/shrouk-mohamed-9561b5221');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.code, color: Colors.white),
                    onPressed: () {
                      _launchUrl('https://github.com/shrouk-mohamed-45');
                      //_launchUrl('https://github.com/dashboard');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  // InkWell(
                  //     onTap: (){
                  //       _launchUrl('tel:+201211611162');
                  //     },
                  //     borderRadius:  BorderRadius.circular(8),
                  //     child: const Text("+201211611162",
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         color: Colors.white,
                  //       ),
                  //     )),
                  // SizedBox(
                  //   width: 50.w,
                  // ),
                  InkWell(
                      onTap: () {
                        _launchUrl(
                            'mailto:shroukmz123@gmail.com?subject=Hello&body=I want to connect');
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: const Text(
                        "shroukmz123@gmail.com",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 35.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
