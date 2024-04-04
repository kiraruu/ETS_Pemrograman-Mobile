import 'package:url_launcher/url_launcher.dart';

Future<void> LaunchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false, forceWebView: false);
  } else {
    throw 'Could not launch $url';
}
}