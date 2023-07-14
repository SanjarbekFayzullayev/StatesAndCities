import 'package:animation_list/animation_list.dart';
import 'package:capitals_app/moduls/words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  final Words word;

  DetailsPage(this.word, {Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF424242),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,color:Colors.white,)),
                  IconButton(
                      onPressed: () {
                        Share.share(
                           "Assalomu aleykum!\n Men sizga dunyodagi barcha davlatlar xaqida to'li ma'lumot olish imkonini beruvchi dasturni sizga tavsiya qilaman.\n"
                            "Ishoning bu juda ajoyib dastur\n"
                            'Yuklab olish 📥!\n\n https://play.google.com/store/apps/dev?id=6201008957698378119\n\n'
                               "Assalomu aleykum!\n I recommend you a program that allows you to get full information about all countries in the world.\n"
                               "Believe me this is a very cool program\n"
                               'Download 📥!\n\n https://play.google.com/store/apps/dev?id=6201008957698378119'
                        );
                      },
                      icon: const Icon(Icons.share,color:  Colors.white,)),
                ],
              ),
              Text(
                widget.word.name!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: AnimationList(
                  duration: 1500,
                  children: [
                    detailsInfo("Capital number 🆔:", widget.word.id.toString()),
                    detailsInfo("ISO3 📌:", widget.word.iso3!),
                    detailsInfo("ISO2 📌:", widget.word.iso2!),
                    detailsInfo("Numeric code 🚘:", widget.word.numeric_code!),
                    detailsInfo("Phone code ☎:", widget.word.phone_code!),
                    detailsInfo("Capital 🏢:", widget.word.capital!),
                    detailsInfo("Currency 💱:", widget.word.currency!),
                    detailsInfo("Currency Name 💲:", widget.word.currency_name!),
                    detailsInfo("TLD 🌐:", widget.word.tld!),
                    detailsInfo("Native 🎓:", widget.word.native!),
                    detailsInfo("Region 🌏:", widget.word.region!),
                    detailsInfo("Subregion 🚩:", widget.word.subregion!),
                    detailsInfo("Latitude 📍:", widget.word.latitude!),
                    detailsInfo("Longitude 📍:", widget.word.longitude!),
                    detailsInfo("Emoji 💡:", widget.word.emoji!),
                    detailsInfo("EmojiU 🔖:", widget.word.emojiU!),
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buttonCard("Location", Icons.location_on,
                              url:
                                  "https://www.google.com/maps/place/${widget.word.name}"),
                          buttonCard("Copy this info", Icons.copy),
                          buttonCard("More info", Icons.book_outlined,
                              url:
                                  "https://en.wikipedia.org/wiki/${widget.word.name}"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget detailsInfo(String name, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
              name,
              style: const TextStyle(fontSize: 18),
            )),
            Expanded(
                child: Text(
              value,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ))
          ],
        ),
      ),
    );
  }

  Widget buttonCard(String text, IconData iconData, {url}) {
    return Card(
      elevation: 12,
      shadowColor: Colors.black,
      child: TextButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white)),
          onPressed: () {
            url == null
                ? Clipboard.setData(ClipboardData(
                    text:
                        "Capital number 🆔:${widget.word.id.toString()}\nCapital name 📑:${widget.word.id.toString()}\nISO3 📌:, ${widget.word.iso3!}\nISO2 📌:,${widget.word.iso2!}\nNumeric code 🚘:,${widget.word.numeric_code!}\nPhone code ☎:${widget.word.phone_code!}\nCapital 🏢:${widget.word.capital!}\nCurrency 💱: ${widget.word.currency!}\nCurrency Name 💲:${widget.word.currency_name!}\nTLD 🌐:${widget.word.tld!}\nNative 🎓:${widget.word.native!}\nRegion 🌏:${widget.word.region!}\nSubregion 🚩:${widget.word.subregion!}\nLatitude 📍:${widget.word.latitude!}\nLongitude 📍:${widget.word.longitude!}\nEmoji 💡:${widget.word.emoji!}\nEmojiU 🔖:${widget.word.emojiU!}"))
                : _launchUrl(url.toString());
          },
          child: Column(
            children: [
              Icon(iconData, color: const Color(0xFF424242)),
              Text(text, style: const TextStyle(color: Color(0xFF424242))),
            ],
          )),
    );
  }

  _launchUrl(url) async {
    await launch(url);
  }
}
