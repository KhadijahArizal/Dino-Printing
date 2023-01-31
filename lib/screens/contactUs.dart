import 'package:details/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SocialMedia { facebook, instagram, whatsapp, telegram }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class contactUs extends StatefulWidget {
  const contactUs({Key? key}) : super(key: key);

  @override
  State<contactUs> createState() => _contactUsState();
}

class _contactUsState extends State<contactUs> {
  
 Widget aboutUs(
          {required String image,
          required String title,
          required String subtitle}) =>
      Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //padding: const EdgeInsets.only(left: 20),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image))),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildSocialButton(
          {required IconData icon,
          Color? color,
          required VoidCallback onClicked}) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          width: 60,
          height: 40,
          child: Center(
            child: FaIcon(icon, color: color, size: 30),
          ),
        ),
      );

  Widget buildSocialButtons() => Card(
        margin: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSocialButton(
              icon: FontAwesomeIcons.squareFacebook,
              color: Colors.blue,
              onClicked: () => share(SocialMedia.facebook),
            ),
            buildSocialButton(
              icon: FontAwesomeIcons.telegram,
              color: Colors.lightBlue,
              onClicked: () => share(SocialMedia.telegram),
            ),
            buildSocialButton(
              icon: FontAwesomeIcons.instagram,
              color: Colors.purple,
              onClicked: () => share(SocialMedia.instagram),
            ),
            buildSocialButton(
              icon: FontAwesomeIcons.whatsapp,
              color: Colors.green,
              onClicked: () => share(SocialMedia.whatsapp),
            ),
          ],
        ),
      );

  Future share(SocialMedia socialPlatform) async {
    final urls = {
      SocialMedia.facebook: 'https://www.facebook.com/syahdan.fathanah/',
      SocialMedia.telegram: 'https://telegram.me/zfathanah',
      SocialMedia.instagram: 'https://www.instagram.com/fthnh_29/',
      SocialMedia.whatsapp: 'https://wa.me/601151617916'
    };

    final url = urls[socialPlatform]!;

 
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Contact Us'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 50),
        height: 500,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //margin: const EdgeInsets.all(10),
          children: [
            aboutUs(
                image: 'assets/logo.png',
                title: 'WHO WE AREs',
                subtitle:
                    'Dyno Printing was built in 2022.\nWe serve printing services that can be ordered online.'),
          ],
        ),
      ),
      bottomNavigationBar: buildSocialButtons(),
    );
  }
}
