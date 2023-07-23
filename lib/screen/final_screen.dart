import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quote_app/controller/image_service.dart';
import 'package:quote_app/screen/share_plus.dart';
import 'package:quote_app/widgets/appbar_widget.dart';
import 'package:quote_app/widgets/bottom_sheets_widget.dart';
import 'package:quote_app/widgets/imge_body_widget.dart';
import 'package:share_plus/share_plus.dart';

class FinalScreen extends StatelessWidget {
   FinalScreen({Key? key, required this.imageUrl , required this.content}) : super(key: key);
  final Color color = const Color.fromRGBO(68, 68, 68, 1.0);
final String imageUrl ;
final String content ;





  @override
  Widget build(BuildContext context) {
    GlobalKey globalKey = GlobalKey();
    Uint8List? pngBytes;

    SnackBar getResultSnackBar(ShareResult result) {
      return SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Share result: ${result.status}"),
            if (result.status == ShareResultStatus.success)
              Text("Shared to: ${result.raw}")
          ],
        ),
      );
    }

    void _onShareXFileFromAssets(BuildContext context, ByteData? data) async {
      final box = context.findRenderObject() as RenderBox?;
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      // final data = await rootBundle.load('assets/flutter_logo.png');
      final buffer = data!.buffer;
      final shareResult = await Share.shareXFiles(
        [
          XFile.fromData(
            buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
            name: 'screen_shot.png',
            mimeType: 'image/png',
          ),
        ],
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );

      scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
    }

    Future<void> capturePng() async {
      RenderRepaintBoundary boundary =
      globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      //if (boundary.debugNeedsPaint) {
      if (kDebugMode) {
        print("Waiting for boundary to be painted.");
      }
      await Future.delayed(const Duration(milliseconds: 20));
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      pngBytes = byteData!.buffer.asUint8List();
      if (kDebugMode) {
        print(pngBytes);
      }
      //if (mounted) {
        _onShareXFileFromAssets(context, byteData);
     // }
      //}*/
    }

    return Scaffold(
      backgroundColor: color,
      appBar:AppBarWidget(
        onTap: (){},
          color: color,
        iconButtonLeading: IconButton(
          onPressed: (){
            Navigator.pushNamed(context, '/home_screen');
          },
          icon:const Icon(Icons.arrow_back_ios_new,color: Colors.white,),
        ),
iconButtonAction: IconButton(onPressed: (){},icon:const Icon(Icons.ac_unit,color: Colors.transparent,),),

      ),
      bottomNavigationBar: BottomSheetsWidget(
          widget: Row(
            children: [
             const SizedBox(width: 80,),
              Column(
                children: [
                  IconButton(
                      onPressed: (){},
                      icon:const Icon(Icons.share,color: Color(0xFF40B2E1),)

                  ),
                 const Text('Share'),
                ],
              ),
             const SizedBox(width: 100,),
              Column(
                children: [
                  IconButton(
                      onPressed: ()=>capturePng()
                        // when onPressed execute this task

                      ,
                      icon:const Icon(Icons.save_alt,color: Color(0xFF40B2E1),)

                  ),
                  const Text('Share'),
                ],
              ),
            ],


          ),



      ),

      body: RepaintBoundary(
        key: globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Spacer(flex: 3,),
            SizedBox(
              width: 350,
              height: 80,
              child: Text(content , style:const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0
              ),),
            ),
              //Spacer(),
              Center(child: ImageBodyWidget(imageUrl: imageUrl,)),
              const Spacer(),
]
    ),
      ),



    );
  }
}
