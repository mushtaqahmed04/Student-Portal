import 'package:admin/UI_Helper/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminCourse extends StatelessWidget {
  AdminCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.secondary,
      // appBar: AppBar(),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Material(
              child: Container(
                height: 55,
                color: colors.secondary,
                child: TabBar(
                  dividerColor: Colors.transparent,

                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.only(
                    top: 9.5,
                    bottom: 9.5,
                    left: 9.5,
                    right: 9.5,
                  ),
                  unselectedLabelColor: colors.pirmary,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: colors.pirmary,
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: colors.pirmary, width: 1.5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "All",
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: colors.pirmary, width: 1.5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Clear",
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: colors.pirmary, width: 1.5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Pending",
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
                children: [ALLCourse(), Text("data2"), Text("data3")],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AllCGPA extends StatelessWidget {
  const AllCGPA({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Container(child: ALLCourse()),
        // ALLCourse()
      ],
    );
  }
}

class ALLCourse extends StatelessWidget {
  const ALLCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("User").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while fetching data
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          // Handle potential errors from the stream
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        if (snapshot.hasData) {
          // Handle case where no documents are in the collection
          if (snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No courses available."));
          }

          return Expanded(
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];

                // Get the data from the document snapshot as a Map
                // final Map<String, dynamic> data =
                //     documentSnapshot.data()! as Map<String, dynamic>;

                // Access the specific field you want to display, e.g., 'courseName'
                // Replace 'courseName' with the actual field name from your Firestore document
                // final String courseName = data['Name'] ?? 'No Name';

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    tileColor: const Color.fromARGB(255, 168, 236, 170),
                    title: Text(
                      documentSnapshot["Mushtaq Ahmed"],
                    ), // Use the extracted field here
                    trailing: const Text(
                      "30/100",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                );
              },
            ),
          );
        }

        // Default case if none of the above conditions are met
        return const Center(child: Text("An unexpected error occurred."));
      },
    );
  }
}
