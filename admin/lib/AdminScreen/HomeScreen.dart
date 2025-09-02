import 'package:admin/UI_Helper/Colors.dart';
import 'package:flutter/material.dart';


class AdminHomescreen extends StatelessWidget {
  AdminHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.secondary,
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(240, 87, 16, 1),
                          Color.fromRGBO(245, 120, 3, 1),
                          Color.fromRGBO(236, 138, 10, 1),
                          Color.fromRGBO(236, 171, 6, 1),
                          Color.fromRGBO(222, 170, 38, 1),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 20),
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(222, 170, 38, 1),
                                Color.fromRGBO(236, 171, 6, 1),
                                Color.fromRGBO(236, 138, 10, 1),
                                Color.fromRGBO(245, 120, 3, 1),
                                Color.fromRGBO(240, 87, 16, 1),
                              ],
                              // begin: Alignment.topLeft,
                              // end: Alignment.bottomRight,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.transparent,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/180746319.jpeg",
                              ),
                              radius: 40,
                            ),
                          ),

                          // SizedBox(width: 20,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Mushtaq Ahmed Ishtiaq",
                                style: TextStyle(
                                  fontFamily: "popin",
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "BSSE SECOND YEAR ( A )",
                                style: TextStyle(
                                  fontFamily: "popin",
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Seat NO : EB24210106087",
                                style: TextStyle(
                                  fontFamily: "popin",
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Material(
              child: Container(
                height: 60,
                color: colors.secondary,
                child: TabBar(
                  dividerColor: Colors.transparent,
                  // isScrollable: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.only(top: 9, bottom: 9),
                  unselectedLabelColor: colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: colors.pirmary,
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: colors.pirmary, width: 1.5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Fourth",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "popin",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: colors.pirmary, width: 1.5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Third",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "popin",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: colors.pirmary, width: 1.5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Second",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "popin",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: colors.pirmary, width: 1.5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "First",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "popin",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Fourthsemester(),
                  Thirdsemester(),
                  secondsemester(),
                  Firstsemester(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Fourthsemester extends StatelessWidget {
  Fourthsemester({super.key});

  List course = [
    "Database Management Systems",
    "Software Design and Architecture",
    "Operating System",
    "Artificial Intellligence",
    "Civics and community Engagement",
    "Computer Organization \n & Assembly Language",
  ];
  List professsor = [
    "MR SAMI UL HUDA ( SH )",
    "MR HUSSAIN SALEEM ( HS )",
    "DR KHALIQ KHANZADA ( KK ) \n/ MR AKHTAR JANANGIR ( AJ )",
    "DR SYEDA IQRA HUSSAIN ( SIH )",
    "PROF DR SOBIA SHAHZAD ( SS ) \n   / DR SAKINA RIAZ ( SR )",
    "MR BILAL M IQBAL ( BI )",
  ];
  List course_Id = ["SE-452", "SE-454", "SE-458", "SE-460", "SE-460", "SE-456"];
  List credit_hour = ["3+1", "3+0", "2+1", "2+1", "2+1", "2+0"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: 20,
            right: 20,
          ),
          child: Container(
            // height: 80,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade400,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    course[index],
                    style: TextStyle(fontFamily: "popin_medium", fontSize: 16),
                  ),
                  Text(
                    professsor[index],
                    style: TextStyle(fontFamily: "popin", fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        course_Id[index],
                        style: TextStyle(fontFamily: "popin", fontSize: 16),
                      ),
                      SizedBox(width: 35),
                      Text(
                        "Credit Hour : ${credit_hour[index]}",
                        style: TextStyle(fontFamily: "popin", fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Thirdsemester extends StatelessWidget {
  Thirdsemester({super.key});

  List course = [
    "Data Structure and Applications",
    "Software Requirement Engineering",
    "Digital Logic Design",
    "Linear Algebra",
    "Communication and Presentation Skills",
    "Urdu",
  ];
  List professsor = [
    "MS DURRE SHAHWAR AGHA (DSA) / \n        MS FARHEEN QAZI ( FQ )",
    "DR M SHAHAB SIDDIQUI (MSS)",
    "    DR ZEESHAN ABBAS (ZA) / \n MR BARI AHMED KHAN ( BAK )",
    "DR FOZIA HANIF (FH)",
    "MR FAZLU REHMAN (FR)",
    "PROF DR. TANZEEM UL FIRDOUS (TF) / \n         DR RAHAT AFSHAN ( RA )",
  ];
  List course_Id = ["SE-451", "SE-453", "SE-455", "SE-457", "SE-459", "SE-461"];
  List credit_hour = ["3+1", "3+0", "2+1", "3+0", "3+0", "2+0"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: 20,
            right: 20,
          ),
          child: Container(
            // height: 80,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade400,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    course[index],
                    style: TextStyle(fontFamily: "popin_medium", fontSize: 16),
                  ),
                  Text(
                    professsor[index],
                    style: TextStyle(fontFamily: "popin", fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        course_Id[index],
                        style: TextStyle(fontFamily: "popin", fontSize: 16),
                      ),
                      SizedBox(width: 35),
                      Text(
                        "Credit Hour : ${credit_hour[index]}",
                        style: TextStyle(fontFamily: "popin", fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class secondsemester extends StatelessWidget {
  secondsemester({super.key});

  List course = [
    "Object Oriented Concepts\n         & Programming",
    "Software Engineering fundamental",
    "Multivariable Calculus",
    "Applied Physics",
    "Probability & Statistics",
    "Islamic Studies Orethics",
  ];
  List professsor = [
    "MR BADAR SAMI ( BS )",
    "MS MALEEHA ANWAR ( MA )",
    "MR JAMIL USMANI ( JU )",
    "  DR ZEESHAN ABBAS ( ZA ) /\n PROF DR INTIKHAB ULFAT ( IU )",
    "         DR MUDASSIR UDDIN ( MU )/ \n MR MUHAMMAD ETEZAZ IBRAHIM ( MEI )",
    "       DR SHAHNAZ GHAZI ( SG ) /\n DR S GHAZANFAR AHMED ( SGA )",
  ];
  List course_Id = ["SE-352", "SE-354", "SE-356", "SE-358", "SE-360", "SE-362"];
  List credit_hour = ["3+1", "3+0", "3+0", "2+1", "3+0", "2+0"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: 20,
            right: 20,
          ),
          child: Container(
            // height: 80,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade400,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    course[index],
                    style: TextStyle(fontFamily: "popin_medium", fontSize: 16),
                  ),
                  Center(
                    child: Text(
                      professsor[index],
                      style: TextStyle(fontFamily: "popin", fontSize: 16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        course_Id[index],
                        style: TextStyle(fontFamily: "popin", fontSize: 16),
                      ),
                      SizedBox(width: 35),
                      Text(
                        "Credit Hour : ${credit_hour[index]}",
                        style: TextStyle(fontFamily: "popin", fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Firstsemester extends StatelessWidget {
  Firstsemester({super.key});

  List course = [
    "Programming Fundamentals",
    "Introduction to information & \n Communication Technologies ",
    "Calculus and Analytical Geometry",
    "Discrete Structures",
    "Functional English",
    "Ideology and Constitution of Pakistan",
  ];
  List professsor = [
    "MR SAMI UL HUDA ( SH ) / \n AKHTER JAHANGIR ( AJ )",
    "M ANWAR ( MA )",
    "MR USMAN QURESHI ( UQ ) / \n MR USMAN QURESHI ( UQ )",
    "MR EITZAZ IBRAHIM ( EI )",
    "        MS SHAZIA NAZ ( SN ) / \n MS TAHIRA ABDUL HAKEEM ( TAH )",
    "DR NUSRAT IDRESS ( NI ) / \n DR KAMRAN KHAN ( KK )",
  ];
  List course_Id = ["SE-351", "SE-353", "SE-355", "SE-357", "SE-359", "SE-361"];
  List credit_hour = ["3+1", "3+0", "3+0", "3+0", "3+0", "2+0"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: 20,
            right: 20,
          ),
          child: Container(
            // height: 80,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade400,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    course[index],
                    style: TextStyle(fontFamily: "popin_medium", fontSize: 16),
                  ),
                  Text(
                    professsor[index],
                    style: TextStyle(fontFamily: "popin", fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        course_Id[index],
                        style: TextStyle(fontFamily: "popin", fontSize: 16),
                      ),
                      SizedBox(width: 35),
                      Text(
                        "Credit Hour : ${credit_hour[index]}",
                        style: TextStyle(fontFamily: "popin", fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
