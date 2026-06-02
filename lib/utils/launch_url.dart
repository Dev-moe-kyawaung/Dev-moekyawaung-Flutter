import 'package:url_launcher/url_launcher.dart';

Future<void> launchExternalUrl(String url) async {
  final uri = Uri.parse(url);
  if (!await canLaunchUrl(uri)) {
    throw 'Could not launch $url';
  }
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

Future<void> launchEmail(String email, {String subject = '', String body = ''}) async {
  final uri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      if (subject.isNotEmpty) 'subject': subject,
      if (body.isNotEmpty) 'body': body,
    },
  );
  await launchUrl(uri);
}
