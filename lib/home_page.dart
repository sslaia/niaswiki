import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:niaswiki/about.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color? color = Colors.indigo[50];
  String url = 'https://nia.m.wikipedia.org/wiki/';
  String title = 'Wikipedia Nias';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/book.webp'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent.withAlpha(65),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white70),
          elevation: 4.0,
          title: Text(
            'Nias Wiki',
            style: GoogleFonts.cinzelDecorative(
                textStyle: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white70)),
          ),
          actions: [
            // IconButton(
            //   icon: const Icon(
            //     Icons.local_florist,
            //     // color: Colors.white70,
            //   ),
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //           builder: (BuildContext context) => AboutNiasWiki()),
            //     );
            //   },
            // ),
            PopupMenuButton(
                // icon: Icon(Icons.language_outlined),
                // color: Colors.white,
                onSelected: (item) {
                  switch (item) {
                    case 0:
                      context.setLocale(Locale('en'));
                      break;
                    case 1:
                      context.setLocale(Locale('id'));
                      break;
                    // case 2:
                    //   context.setLocale(Locale('nia'));
                    //   break;
                    case 3:
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) => AboutNiasWiki()),
                      );
                      break;
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: ListTile(
                            leading: Icon(Icons.language_outlined,
                                color: Colors.purple),
                            title: Text('english').tr()),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: ListTile(
                            leading: Icon(Icons.language_outlined,
                                color: Colors.indigo),
                            title: Text('indonesia').tr()),
                      ),
                      // PopupMenuItem<int>(
                      //   value: 2,
                      //   child: ListTile(
                      //       leading:
                      //           Icon(Icons.auto_stories, color: Colors.indigo),
                      //       title: Text('nias').tr()),
                      // ),
                      // PopupMenuDivider(),
                      PopupMenuItem<int>(
                          value: 3,
                          child: ListTile(
                            leading:
                                Icon(Icons.info_outline, color: Colors.orange),
                            title: Text('about').tr(),
                          ))
                    ])
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 32.0),
              child: Text(
                'tagline',
                style: GoogleFonts.parisienne(
                    textStyle: TextStyle(
                        fontSize: 24.0,
                        // fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ).tr(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Spacer(),
                  TextButton(
                    child: Text(
                      'Wikibuku',
                      style: GoogleFonts.cinzelDecorative(
                        textStyle: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      color = Colors.purple[50];
                      url = 'https://incubator.m.wikimedia.org/wiki/Wb/nia/';
                      title = 'Wikibooks';
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //       builder: (BuildContext context) =>
                      //           WikiHome(color: color, url: url, title: title)),
                      // );
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Wikipedia',
                      style: GoogleFonts.cinzelDecorative(
                        textStyle: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      color = Colors.indigo[50];
                      url = 'https://nia.m.wikipedia.org/wiki/';
                      title = 'Wikipedia';
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //       builder: (BuildContext context) =>
                      //           WikiHome(color: color, url: url, title: title)),
                      // );
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Wiktionary',
                      style: GoogleFonts.cinzelDecorative(
                        textStyle: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      color = Colors.orange[50];
                      url = 'https://nia.m.wiktionary.org/wiki/';
                      title = 'Wiktionary';
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //       builder: (BuildContext context) =>
                      //           WikiHome(color: color, url: url, title: title)),
                      // );
                    },
                  ),
                  Text(
                    'goal',
                    style: GoogleFonts.parisienne(
                      textStyle: TextStyle(
                          fontSize: 24.0,
                          // fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ).tr(),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Center(
              child: Text(
                'foto_attribution',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .apply(color: Colors.white),
              ).tr(),
            ),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
