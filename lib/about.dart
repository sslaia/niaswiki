import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutNiasWiki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('about').tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: RichText(
            text: TextSpan(
                style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                  ),
                ),
                // style: TextStyle(color: Colors.black87, fontSize: 24),
                children: <TextSpan>[
                  TextSpan(
                      text: 'app_name\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          'Aplikasi ini merupakan alat bantu bagi mereka yang berbahasa Nias untuk menyumbang entri di kamus Wiktionary Nias (https://nia.wiktionary.org), ensiklopedia Nias (https://nia.m.wikipedia.org) dan buku Nias (https://incubator.m.wikimedia.org/wiki/Wb/nia/Olayama).\n\n'),
                  TextSpan(
                      text:
                          'Komunitas pegiat bahasa Nias memilih infrastruktur dari Wikimedia (Wikibuku, Wikipedia, Wiktionary dlsb) karena alasan teknis (layanan Wikimedia bersifat bebas, memungkinkan kolaborasi dan telah terbukti menjadi tulang punggung pengetahuan, yang dipakai oleh Google dan berbagai perusahaan IT lainnya).\n\n'),
                  TextSpan(
                      text: 'Apa bisa dibuat dengan aplikasi ini\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          'Aplikasi ini dibuat terutama untuk menulis entri baru atau mengedit entri yang telah ada di Wiktionary, Wikipedia dan Wibibuku Li Niha. Kemudian ada satu lagi aplikasi yang lebih bertujuan memperdalam penggunaan bahasa Nias. Lihat aplikasi Bola-bola (https://github.com/sslaia/bola-bola).\n\n'),
                  TextSpan(text: 'Ya\'ahowu! Kode aplikasi ini tersedia di '),
                  TextSpan(
                      text:
                          'https://github.com/sslaia/nias_wiki. Silakan menyumbang kode bagi penyempurnaan aplikasi ini di sana.\n\n'),
                  TextSpan(
                      text: 'About Nias Wiki\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          'The app was created as a tool to write new and edit existing entries on Nias Wiktionary (https://nia.wiktionary.org), Wikipedia (https://nia.m.wikipedia.org) and Wikibooks (https://incubator.m.wikimedia.org/wiki/Wb/nia/Olayama).\n\n'),
                  TextSpan(
                      text:
                          'It is part of the Nias language development programme (2020-2025). The Nias language enthusiasts had chosen Wikimedia with its various projects (Wikibooks, Wikipedia, Wiktionary etc.) because its free and collaborative nature as well as its contributions to the global effort to make knowledge accessible to everyone.\n\n'),
                  TextSpan(
                      text: 'What can the app do\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          'The app is written with specific tasks in mind: creating new entry or editing existing entries in the Nias Wiktionary, Wikipedia and Wikibooks. If you are looking for an app that will help improving your Nias language, then the app Bola-bola (https://github.com/sslaia/bola-bola) could be a better choice. In addition there are also independent apps for Nias Wikipedia and Wikibooks.\n\n'),
                  TextSpan(
                      text: 'That\'s all. See the source code of this app at '),
                  TextSpan(
                      text:
                          'https://github.com/sslaia/nias_wiki. Every code contribution matters.\n\n'),
                ]),
          ),
        ),
      ),
    );
  }
}
