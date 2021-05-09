import 'dart:async';
import 'dart:io' as IO;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:niaswiki/home_page.dart';
import 'package:niaswiki/wiki_drawer.dart';
import 'package:niaswiki/wiki_provider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikiHome extends StatefulWidget {
  String title;
  String url;
  Color? color;

  WikiHome({
    Key? key,
    required this.title,
    required this.url,
    required this.color,
  }) : super(key: key);

  @override
  _WikiHomeState createState() => _WikiHomeState();
}

class _WikiHomeState extends State<WikiHome> {
  WebViewController? controller;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final key = GlobalKey();
  // String lang = 'English';

  @override
  void initState() {
    if (IO.Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WikiProvider>(
      builder: (context, wikiNotifier, child) => WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black54),
              backgroundColor: widget.color,
              title: Text(
                widget.title,
                style: GoogleFonts.cinzelDecorative(
                    textStyle: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54)),
              ),
              actions: [
                FutureBuilder<WebViewController>(
                  future: _controller.future,
                  builder: (BuildContext context,
                      AsyncSnapshot<WebViewController> controller) {
                    if (controller.hasData) {
                      return Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.refresh,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              controller.data!.reload();
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.shuffle_outlined,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              controller.data!
                                  .loadUrl(widget.url + 'Special:Random');
                            },
                          ),
                          PopupMenuButton<int>(
                            color: Colors.white,
                            onSelected: (item) {
                              switch (item) {
                                case 0:
                                  wikiNotifier.setWiki('Wikibooks');
                                  widget.title = 'Wikibooks';
                                  widget.url =
                                      'https://incubator.m.wikimedia.org/wiki/Wb/nia/';
                                  controller.data!
                                      .loadUrl(widget.url + 'Olayama');
                                  setState(() {
                                    widget.color = Colors.purple[50];
                                  });
                                  break;
                                case 1:
                                  wikiNotifier.setWiki('Wikipedia');
                                  widget.title = 'Wikipedia';
                                  widget.url =
                                      'https://nia.m.wikipedia.org/wiki/';
                                  controller.data!
                                      .loadUrl(widget.url + 'Olayama');
                                  setState(() {
                                    widget.color = Colors.indigo[50];
                                  });
                                  break;
                                case 2:
                                  wikiNotifier.setWiki('Wiktionary');
                                  widget.title = 'Wiktionary';
                                  widget.url =
                                      'https://nia.m.wiktionary.org/wiki/';
                                  controller.data!
                                      .loadUrl(widget.url + 'Olayama');
                                  setState(() {
                                    widget.color = Colors.orange[50];
                                  });
                                  break;
                                case 3:
                                  setState(() {
                                    context.setLocale(Locale('en'));
                                  });
                                  break;
                                case 4:
                                  setState(() {
                                    context.setLocale(Locale('id'));
                                  });
                                  break;
                                // case 5:
                                //   lang = 'Nias';
                                //   break;
                                case 6:
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomePage(),
                                      ),
                                      (route) => false);
                              }
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem<int>(
                                value: 0,
                                child: ListTile(
                                    leading: Icon(Icons.auto_stories,
                                        color: Colors.purple),
                                    title: Text('wikibooks').tr()),
                              ),
                              const PopupMenuItem<int>(
                                value: 1,
                                child: ListTile(
                                    leading: Icon(Icons.auto_stories,
                                        color: Colors.indigo),
                                    title: Text('Wikipedia')),
                              ),
                              const PopupMenuItem<int>(
                                value: 2,
                                child: ListTile(
                                    leading: Icon(Icons.auto_stories,
                                        color: Colors.orange),
                                    title: Text('Wiktionary')),
                              ),
                              const PopupMenuDivider(),
                              PopupMenuItem<int>(
                                value: 3,
                                child: ListTile(
                                    leading: Icon(Icons.language_outlined,
                                        color: Colors.purple),
                                    title: Text('english').tr()),
                              ),
                              PopupMenuItem<int>(
                                value: 4,
                                child: ListTile(
                                    leading: Icon(Icons.language_outlined,
                                        color: Colors.indigo),
                                    title: Text('indonesia').tr()),
                              ),
                              // PopupMenuItem<int>(
                              //   value: 5,
                              //   child: ListTile(
                              //       leading: Icon(Icons.language_outlined,
                              //           color: Colors.orange),
                              //       title: Text('Nias')),
                              // ),
                              const PopupMenuDivider(),
                              PopupMenuItem<int>(
                                value: 6,
                                child: ListTile(
                                    leading: Icon(Icons.logout,
                                        color: Colors.purple),
                                    title: Text('start_screen').tr()),
                              ),
                            ],
                          )
                        ],
                      );
                    }
                    return Container();
                  },
                )
              ],
            ),
            drawer: WikiDrawer(
                controller: _controller,
                color: widget.color,
                url: widget.url,
                title: widget.title),
            body: WebView(
              key: key,
              initialUrl: widget.url + 'Olayama',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.future.then((value) => controller = value);
                _controller.complete(webViewController);
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    var status = await controller!.canGoBack();
    if (status) {
      controller!.goBack();
      return false;
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('close_webview').tr(),
          actions: [
            TextButton(
              onPressed: () {
                // controller!.reload();
                Navigator.of(context).pop();
              },
              child: Text('no').tr(),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil<dynamic>(
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()),
                    (Route<dynamic> route) => false);
              },
              child: Text('yes').tr(),
            ),
          ],
        ),
      );
      return true;
    }
  }
}
