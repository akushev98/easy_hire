import 'package:easy_hire/models/msg_dialog.dart';
import 'package:easy_hire/pages/dialog_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  List<MsgDialog> dialogsList = [
    MsgDialog(
      name: "Jack Milton",
      lastMsg:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis.",
    ),
    MsgDialog(
      name: "Floyd Miles",
      lastMsg:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis.",
    )
  ];

  get openProjectsMessages {
    return Container(
      child: ListView.builder(
          itemCount: dialogsList.length,
          itemBuilder: (context, index) {
            return dialogsList[index].getDialogItem(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DialogPage(
                      dialogInfo: dialogsList[index],
                    )));
              },
            );
          }),
    );
  }

  get inWorkMessages {
    return Container(
      child: ListView.builder(
          itemCount: dialogsList.length,
          itemBuilder: (context, index) {
            return dialogsList[index].getDialogItem(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DialogPage(
                      dialogInfo: dialogsList[index],
                    )));
              },
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Text(
                "Messages",
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  letterSpacing: 0.38,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF252525),
                ),
              ),
              backgroundColor: Color(0xFFF4F4F4),
            ),
            backgroundColor: Colors.white,
            body: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Color(0xFFF4F4F4),
                appBar: PreferredSize(
                  preferredSize: Size(MediaQuery.of(context).size.width, 56),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, top: 8, right: 16),
                    child: AppBar(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      elevation: 0,
                      toolbarHeight: 48,
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      bottom: TabBar(
                          unselectedLabelColor: Color(0xFF252525),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: Color(0xFF252525),
                          unselectedLabelStyle: GoogleFonts.montserrat(
                            fontSize: 15,
                          ),
                          labelStyle: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.24,
                          ),
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xFF42B39B)),
                          tabs: [
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Open project"),
                              ),
                            ),
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("In work"),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                body: Container(
                  margin: EdgeInsets.only(top: 16),
                  color: Colors.white,
                  child: TabBarView(
                      physics: ScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      children: [
                        openProjectsMessages,
                        inWorkMessages,
                      ]),
                ),
              ),
            )));
  }
}