import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/core/uitls/app_colors.dart';
import 'package:portfolio/core/uitls/image_manager.dart';
import 'package:portfolio/features/portfolio/data/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/uitls/app_constant.dart';

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
      description: "Flutter Developer\n Dec 2024 – Present",
    ),
    ProjectModel(
      title: "Icore Soft",
      image: ImageManager.exApp,
      description: "Flutter Developer\n Apr 2025 – Jun 2025",
    ),
    ProjectModel(
      title: "Codratech",
      image: ImageManager.exApp,
      description: "Flutter Developer\n Mar 2024 – Oct 2024",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Breakpoints
    bool isMobile = screenWidth < 800;
    bool isTablet = screenWidth >= 800 && screenWidth < 1200;
    bool isDesktop = screenWidth >= 1200;

    double headingFont = isMobile ? 24 : isTablet ? 32 : 40;
    double subHeadingFont = isMobile ? 20 : isTablet ? 28 : 35;
    double textFont = isMobile ? 10 : isTablet ? 12 : 25;
    double sectionFont = isMobile ? 20 : isTablet ? 25 : 30;

    double avatarSize = isMobile ? 120 : isTablet ? 200 : 320;
    double projectImageWidth = isMobile ? 160 : isTablet ? 220 : 400;
    double projectImageHeight = isMobile ? 120 : isTablet ? 180 : 280;
    double projectDescWidth = isMobile ? 115 : isTablet ? 200 : 350;
    double projectDescHeight = isMobile ? 170 : isTablet ? 260 : 350;

    EdgeInsets rowPadding = isMobile
        ? EdgeInsets.symmetric(horizontal: 8, vertical: 8)
        : isTablet
        ? EdgeInsets.symmetric(horizontal: 16, vertical: 12)
        : EdgeInsets.symmetric(horizontal: 24, vertical: 16);

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(ImageManager.logo),
        actions: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () {
                _launchUrl(
                    'https://docs.google.com/document/d/1sGkibjErQ6W6IkNM6TWhjJddKn3qPkgmHTVipecgQUw/edit?usp=sharing');
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Text(
                  "Resume",
                  style: TextStyle(
                    fontSize: textFont + 2,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                MyApp.of(context)!.toggleTheme();
              },
              icon: Icon(
                MyApp.of(context)!.themeMode == ThemeMode.light
                    ? Icons.nightlight_round_outlined
                    : Icons.light_mode_rounded,
              ))
        ],
      ),
      body: Padding(
        padding: rowPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: isMobile
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    headerText(headingFont, subHeadingFont, textFont),
                    SizedBox(height: 20),
                    avatar(avatarSize),
                  ],
                )
                    : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: headerText(headingFont, subHeadingFont, textFont)),
                    avatar(avatarSize),
                  ],
                ),
              ),
              SizedBox(height: 35.h),
              // Work Experience
              Text(
                "Work Experience",
                style: TextStyle(
                    color: MyApp.of(context)!.themeMode == ThemeMode.dark
                        ? Colors.white
                        : AppColors.secondaryColor,
                    fontSize: sectionFont,
                    fontWeight: FontWeight.w400,
                    fontFamily: Constants.boldFont),
              ),
              SizedBox(height: 20.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: workAndExperience.length,
                itemBuilder: (context, index) {
                  final work = workAndExperience[index];
                  return Padding(
                    padding: EdgeInsets.only(right: avatarSize * 1.1,bottom: 20),
                    child: Container(
                      height: avatarSize * 0.74,
                      //width: avatarSize * 0.84,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: MyApp.of(context)!.themeMode == ThemeMode.dark
                              ? [
                            AppColors.secondaryColor,
                            AppColors.secondaryColor,
                            Colors.white.withOpacity(0.3),
                          ]
                              : [
                            AppColors.secondaryColor,
                            AppColors.secondaryColor,
                            Colors.grey.withOpacity(0.3),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 30,),
                          Image.asset(
                            work.image,
                            height: avatarSize * 0.6,
                            width: avatarSize * 0.8,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  work.title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: textFont + 2,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: Constants.boldFont),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  work.description,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: textFont,
                                    fontFamily: Constants.fontFamily,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 25.h),
              // Skills Section
              Text(
                "Skills & Expertise",
                style: TextStyle(
                    color: MyApp.of(context)!.themeMode == ThemeMode.dark
                        ? Colors.white
                        : AppColors.secondaryColor,
                    fontSize: sectionFont,
                    fontWeight: FontWeight.w400,
                    fontFamily: Constants.boldFont),
              ),
              SizedBox(height: 25.h),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10.w,
                runSpacing: 10.h,
                children: [
                  skillAvatar(ImageManager.cPlusPlusLanguage, avatarSize * 0.25),
                  skillAvatar(ImageManager.dartLanguage, avatarSize * 0.25),
                  skillAvatar(ImageManager.cubit, avatarSize * 0.25),
                  skillAvatar(ImageManager.flutterFrameWork, avatarSize * 0.25),
                  skillAvatar(ImageManager.gitHub,avatarSize * 0.2),
                  skillAvatar(ImageManager.swagger,avatarSize * 0.2),
                ],
              ),
              SizedBox(height: 25.h),
              // Mobile Projects
              Text(
                "Mobile Projects",
                style: TextStyle(
                    color: MyApp.of(context)!.themeMode == ThemeMode.dark
                        ? Colors.white
                        : AppColors.secondaryColor,
                    fontSize: sectionFont,
                    fontWeight: FontWeight.w400,
                    fontFamily: Constants.boldFont),
              ),
              SizedBox(height: 25.h),
              Column(
                children: mobileProjects
                    .map((project) => projectCard(
                    project,
                    projectImageWidth,
                    projectImageHeight,
                    projectDescWidth,
                  textFont,
                  projectDescHeight,
                ))
                    .toList(),
              ),
              SizedBox(height: 25.h),
              // Contact Section
              Text(
                "Contact Me",
                style: TextStyle(
                    color: MyApp.of(context)!.themeMode == ThemeMode.dark
                        ? Colors.white
                        : AppColors.secondaryColor,
                    fontSize: sectionFont,
                    fontWeight: FontWeight.w400,
                    fontFamily: Constants.boldFont),
              ),
              SizedBox(height: 20.h),
              Text(
                "If you have any questions or would like to work together, feel free to get in touch!",
                style: TextStyle(
                  color: MyApp.of(context)!.themeMode == ThemeMode.dark
                      ? Colors.white
                      : AppColors.secondaryColor,
                  fontSize: textFont ,
                  fontWeight: FontWeight.w400,
                  fontFamily: Constants.fontFamily,
                ),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  contactIcon(Icons.phone, 'tel:+201211611162'),
                  contactIcon(Icons.email,
                      'mailto:shroukmz123@gmail.com?subject=Hello&body=I want to connect'),
                  contactIcon(Icons.link,
                      'https://www.linkedin.com/in/shrouk-mohamed-9561b5221'),
                  contactIcon(Icons.code,
                      'https://github.com/shrouk-mohamed-45'),
                ],
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: () {
                  _launchUrl(
                      'mailto:shroukmz123@gmail.com?subject=Hello&body=I want to connect');
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "shroukmz123@gmail.com",
                    style: TextStyle(
                      fontSize: headingFont - 12,
                      fontFamily: Constants.boldFont,
                      color: MyApp.of(context)!.themeMode == ThemeMode.dark
                          ? Colors.white
                          : AppColors.secondaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 45.h),
            ],
          ),
        ),
      ),
    );
  }

  // Widgets
  Widget headerText(double headingFont, double subHeadingFont, double textFont) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello! I'm\nShrouk Mohamed",
          style: TextStyle(
            color: MyApp.of(context)!.themeMode == ThemeMode.dark
                ? Colors.white
                : AppColors.secondaryColor,
            fontFamily: Constants.boldFont,
            fontSize: headingFont,
          ),
        ),
        SizedBox(height: 10),
        AnimatedTextKit(
          repeatForever: true,
          animatedTexts:[
          TypewriterAnimatedText(
            "I'm a Software Engineer",
            textStyle: TextStyle(
              color: Colors.indigo.shade400,
              fontFamily: Constants.boldFont,
              fontSize: subHeadingFont,
            ),
            speed: const Duration(milliseconds: 80),
            cursor: '|',
          ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          "Flutter Developer with 1+ years of hands-on experience in designing"
              " and developing complete mobile applications."
    "Proficient in building scalable, maintainable, and clean architectures using "
              "Flutter and Dart, following best practices (Clean Code & Layered "
              "Architecture).Experienced in implementing "
              "Authentication flows and integrating complex RESTful APIs."
              "Skilled in state management with Cubit, "
              "version control with Git (daily push/pull & branching), "
              "and debugging/testing to ensure high-quality applications.",
          style: TextStyle(
            color: MyApp.of(context)!.themeMode == ThemeMode.dark
                ? Colors.white
                : AppColors.secondaryColor,
            fontFamily: Constants.fontFamily,
            fontSize: textFont,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget avatar(double size) {
    return Padding(
      padding: const EdgeInsets.only(right: 22.0),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.9),
              blurRadius: 35,
              spreadRadius: 20,
            ),
            BoxShadow(
              color: AppColors.secondaryColor.withOpacity(0.4),
              blurRadius: 30,
              spreadRadius: 25,
            ),
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.2),
              blurRadius: 30,
              spreadRadius: 25,
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            ImageManager.me,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget skillAvatar(String image, double size) {
    return ClipOval(
      child: Image.asset(
        image,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget skillCircle(String image) {
    return CircleAvatar(
      radius: 28,
      backgroundImage: AssetImage(image),
      backgroundColor: Colors.grey.shade200,
    );
  }

  Widget projectCard(
      ProjectModel project, double imageWidth, double imageHeight, double descWidth,double textFont,double descHeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.0,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            project.image,
            width: imageWidth,
            height: imageHeight,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 8),
          Column(
            children: [
              Text(
                project.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: textFont,
                  fontFamily: Constants.boldFont,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              Container(
                width: descWidth * 1.5,
                height: descHeight *.5 ,
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: MyApp.of(context)!.themeMode == ThemeMode.dark
                        ? [
                      Colors.white.withOpacity(0.1),
                      AppColors.primaryColor,
                      AppColors.secondaryColor,
                    ]
                        : [
                      Colors.grey.withOpacity(0.9),
                      AppColors.primaryColor,
                      AppColors.primaryColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Text(
                  project.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: textFont,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget contactIcon(IconData icon, String url) {
    return IconButton(
      icon: Icon(icon,
          size: 30,
          color: MyApp.of(context)!.themeMode == ThemeMode.dark
              ? Colors.white
              : AppColors.secondaryColor),
      onPressed: () {
        _launchUrl(url);
      },
    );
  }
}
