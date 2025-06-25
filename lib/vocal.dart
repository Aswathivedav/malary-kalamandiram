import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mainproject/paymentpage.dart';
import 'package:url_launcher/url_launcher.dart';

class Vocal extends StatelessWidget {
  const Vocal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final List<bool> isUnlocked = [
            true,
            true,
            false,
            false,
            false,
            false
          ];
          final ragams = [
            {
              'title': 'Ragam: Kalyani',
              'swaras': 'sa, ri, ga, ma, pa, da, ni, sa',
              'link': 'https://youtu.be/lM29cqMytuI?si=H_rEmCBuZ2t2M3Lp'
            },
            {
              'title': 'Ragam: Hamsadhwani',
              'swaras': 'sa, ri, ga, pa, da, sa',
              'link': 'https://www.youtube.com/watch?v=VIDEO_ID2'
            },
            {
              'title': 'Ragam: Mohanam',
              'swaras': 'sa, ri, ga, pa, da, sa',
              'link': 'https://www.youtube.com/watch?v=VIDEO_ID3'
            },
            {
              'title': 'Ragam: Shankarabharanam',
              'swaras': 'sa, ri, ga, ma, pa, da, ni, sa',
              'link': 'https://www.youtube.com/watch?v=VIDEO_ID4'
            },
            {
              'title': 'Ragam: Kharaharapriya',
              'swaras': 'sa, ri, ga, ma, pa, da, ni, sa',
              'link': 'https://www.youtube.com/watch?v=VIDEO_ID5'
            },
            {
              'title': 'Ragam: Bhairavi',
              'swaras': 'sa, ri, ga, ma, pa, da, ni, sa',
              'link': 'https://www.youtube.com/watch?v=VIDEO_ID6'
            },
          ];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                if (isUnlocked[index]) {
                  final url = Uri.parse(ragams[index]['link']!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentPage(onSuccess: () {
                                isUnlocked[index] = true;
                              })));
                  throw 'Could not launch ${ragams[index]['link']}';
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 202, 137, 139),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ragams[index]['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      ragams[index]['swaras']!,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '🎬 Tap to Watch',
                      style:
                          TextStyle(color: Colors.yellowAccent, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
