import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikiDrawer extends StatelessWidget {
  WikiDrawer({
    Key? key,
    required Completer<WebViewController> controller,
    required this.color,
    required this.url,
    required this.title,
  })   : _controller = controller,
        super(key: key);

  final Completer<WebViewController> _controller;
  final Color? color;
  final String url;
  final String title;
  String? booksUrl;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return Container(
              color: color,
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage('assets/images/book.webp')),
                    ),
                    child: Stack(children: [
                      Positioned(
                        bottom: 12.0,
                        left: 12.0,
                        child: Text(
                          'Nias Wiki',
                          style: GoogleFonts.cinzelDecorative(
                              textStyle: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                        ),
                      ),
                    ]),
                  ),
                  ListTile(
                    leading: Icon(Icons.home_outlined),
                    title: Text('home').tr(),
                    onTap: () {
                      Navigator.pop(context);
                      controller.data!.loadUrl(url + 'Olayama');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.local_fire_department_outlined),
                    title: Text("recent_changes").tr(),
                    onTap: () {
                      if (url.contains('Wb/nia')) {
                        booksUrl = 'https://incubator.m.wikimedia.org/wiki/';
                        Navigator.pop(context);
                        controller.data!
                            .loadUrl(booksUrl! + 'Special:RecentChanges');
                      } else {
                        Navigator.pop(context);
                        controller.data!.loadUrl(url + 'Special:RecentChanges');
                      }
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.security_outlined),
                    title: Text("special_pages").tr(),
                    onTap: () {
                      if (url.contains('Wb/nia')) {
                        booksUrl = 'https://incubator.m.wikimedia.org/wiki/';
                        Navigator.pop(context);
                        controller.data!
                            .loadUrl(booksUrl! + 'Special:SpecialPages');
                      } else {
                        Navigator.pop(context);
                        controller.data!.loadUrl(url + 'Special:SpecialPages');
                      }
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('announcement').tr(),
                    onTap: () {
                      Navigator.pop(context);
                      controller.data!.loadUrl(url + title + ':Angombakhata');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.meeting_room_outlined),
                    title: Text('community_portal').tr(),
                    onTap: () {
                      Navigator.pop(context);
                      controller.data!.loadUrl(url + title + ':Bawagöli_zato');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.bubble_chart_outlined),
                    title: Text('village_pump').tr(),
                    onTap: () {
                      Navigator.pop(context);
                      controller.data!.loadUrl(url + title + ':Monganga_afo');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.gesture_outlined),
                    title: Text('sandbox').tr(),
                    onTap: () {
                      Navigator.pop(context);
                      controller.data!.loadUrl(url + title + ':Nahia_wamakori');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.handyman_outlined),
                    title: Text('help').tr(),
                    onTap: () {
                      Navigator.pop(context);
                      controller.data!.loadUrl(url + title + ':Fanolo');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.people_outlined),
                    title: Text('helpers').tr(),
                    onTap: () {
                      Navigator.pop(context);
                      controller.data!.loadUrl(url + title + ':Sangai_halöŵö');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.local_florist_outlined),
                    title: Text('about').tr(),
                    onTap: () {
                      Navigator.pop(context);
                      controller.data!.loadUrl(url + title + ':Sanandrösa');
                    },
                  ),
                ],
              ),
            );
          }
          return Container(
            child: Text('Empty'),
          );
        },
      ),
    );
  }
}
