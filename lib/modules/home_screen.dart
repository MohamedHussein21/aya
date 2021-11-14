import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../admob_manger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late BannerAd _bottomBannerAd;
  bool _isBottomBannerAdLoaded = false;
  final _inlineAdIndex = 3;

  late BannerAd _inlineBannerAd;
  bool _isInlineBannerAdLoaded = false;



  void _createBottomBannerAd() {
    _bottomBannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBottomBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    _bottomBannerAd.load();
  }

  void _createInlineBannerAd() {
    _inlineBannerAd = BannerAd(
      size: AdSize.mediumRectangle,
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isInlineBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    _inlineBannerAd.load();
  }
  @override
  void initState() {
    super.initState();
    _createBottomBannerAd();
    _createInlineBannerAd();
  }

  @override
  void dispose() {
    super.dispose();
    _bottomBannerAd.dispose();
    _inlineBannerAd.dispose();
  }





  Random random = Random();

  List aya = [
    'وَلَكِنَّ الْبِرَّ مَنِ اتَّقَى',
    'ادْخُلُوا الْجَنَّةَ بِمَا كُنْتُمْ تَعْمَلُونَ',
    'إِنَّهُ مَن يَتَّقِ وَيِصْبِرْ فَإِنَّ اللّهَ لاَ يُضِيعُ أَجْرَ الْمُحْسِنِينَ',
    'وَاذْكُرِ اسْمَ رَبِّكَ وَتَبَتَّلْ إِلَيْهِ تَبْتِيلً',
    'فَاذْكُرُونِي أَذْكُرْكُمْ وَاشْكُرُوا لِي وَلَا تَكْفُرُونَِ',
    'وَاتَّقُوا اللَّهَ لَعَلَّكُمْ تُفْلِحُونَ',
    'وَاذْكُرُوا اللَّهَ فِي أَيَّامٍ مَعْدُودَاتٍ',
  ];
  int index = 0;

  void changeIndex() {
    setState(() {
      index = random.nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        bottomNavigationBar: _isBottomBannerAdLoaded
            ? Container(
          height: _bottomBannerAd.size.height.toDouble(),
          width: _bottomBannerAd.size.width.toDouble(),
          child: AdWidget(ad: _bottomBannerAd),
        )
            : null,
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/mmm.png'),
                    fit: BoxFit.cover,
                  )),
                  child: Text('')),
              ListTile(
                onTap: () {},
                title: const Text(
                  'اتصل بنا',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Color(0xffC0936C),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                leading: const Icon(
                  Icons.call,
                  color: Color(0xffC0936C),
                ),
              ),
              ListTile(
                onTap: () {},
                title: const Text(
                  ' ادعم التطبيق',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Color(0xffC0936C),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                leading: const Icon(
                  Icons.money,
                  color: Color(0xffC0936C),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.segment),
              color: const Color(0xffC0936C),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          elevation: 2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'الرئيسية',
                style: TextStyle(color: Color(0xffC0936C), fontSize: 25),
              ),
            ],
          ),
          backgroundColor: const Color(0xffFDF1D9),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/back.jpeg"),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/mmm.png'),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Center(
                          child: Text(
                        '${aya[index]}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffC0936C),
                            fontFamily: 'Al_homam'),
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: 189,
                  height: 50.0,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        changeIndex();
                      });
                    },
                    child: const Text(
                      'آيه جديدة',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xffFDF1D9),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    color: const Color(0xffDFB281),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
