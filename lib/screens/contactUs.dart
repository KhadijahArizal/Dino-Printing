import 'package:details/main.dart';
import 'package:details/routes.dart';
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
  final _formKey = GlobalKey<FormState>();

  dynamic _email;
  dynamic _messages;

  void _setEmail(String email) {
    setState(() {
      _email = email;
    });
  }

  void _setMessage(String message) {
    setState(() {
      _messages = message;
    });
  }

  Widget aboutUs(
          {required String image,
          required String title,
          required String subtitle}) =>
      Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //alignment: Alignment.center,
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
      

  Widget buildSocialButtons({required String title}) => Card(
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            aboutUs(
                image: 'assets/logo.png',
                title: 'WHO WE ARE',
                subtitle:
                    'Dyno Printing was built in 2022. We serve printing services that can be ordered online. User can also choose wheter they are want to pay transfer or COD'),
            Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            TextFormField(
                              autofocus: true,
                              decoration:
                                  const InputDecoration(labelText: 'Email'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Email';
                                }
                                return null;
                              },
                              onChanged: (text) {
                                _setEmail(text);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              autofocus: true,
                              maxLines: 2,
                              decoration: const InputDecoration(
                                labelText: 'Other Details',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (text) {
                                _setMessage(text);
                              },
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              width: double.infinity,
                              height: 55,
                              child: TextButton(
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Thank You'),
                                    content: const Text(
                                        'Your message has been succesfully sent'),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                ),
                                child: const Text('Submit'),
                              ),
                            ),
                          ],
                        )),
                  ),
                ]),
              ),
            )
          ],
        ),
        bottomNavigationBar: buildSocialButtons(title: 'Follow Us on Social Media'),
        );
  }
}
