import 'package:flutter/material.dart';
import 'package:quote_app/screen/final_screen.dart';
import '../controller/image_service.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/bottom_sheets_widget.dart';
import '../widgets/imge_body_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color color = const Color.fromRGBO(68, 68, 68, 1.0);


  String? imageUrl ;
  String? content ;
  void fetchData() async {
    try {

      imageUrl = await fetchImageFromApi();
      setState((){});
      content = await fetchContentFromApi();
      setState((){});
      //print(imageUrl);
    }catch(e){
      imageUrl = null ;
      content = null ;
    }
  }
  void updateData() {
    setState(() {
      imageUrl = null; // Clear the previous data to show a loading indicator
      content = null;
    });

    fetchData(); // Fetch new data from the API and update the UI
  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: color,
      appBar: AppBarWidget(
        color: color,
        onTap: (){
          // when on tap , change content and imageUrl
         updateData();

        },
        iconButtonLeading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/splash2_screen');
          },
        ),
        iconButtonAction: IconButton(
            onPressed: () {
             content ==null||imageUrl ==null?const SizedBox():Navigator.push(context, MaterialPageRoute(builder: (context) => FinalScreen(
                imageUrl: imageUrl!,
                content: content!,
              ),));
            },
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            )),
      ),
      bottomNavigationBar: BottomSheetsWidget(
        widget: Row(
          children: [
            MaterialButton(
                onPressed: () {},
                child: Image.asset(
                  'assets/icons/textcolor_icon.png',
                )),
            MaterialButton(
                onPressed: () {},
                child: Image.asset('assets/icons/fontstyle_icon.png')),
            MaterialButton(
                onPressed: () {},
                child: Image.asset('assets/icons/fontsize_icon.png')),
            MaterialButton(
                onPressed: () {},
                child: Image.asset('assets/icons/copy_icon.png')),
            MaterialButton(
                onPressed: () {},
                child: Image.asset('assets/icons/reset_icon.png')),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        margin:const EdgeInsets.only(top: 100.0),
        child: Stack(
          children: [

             Center(child: imageUrl==null?const CircularProgressIndicator():ImageBodyWidget(imageUrl: imageUrl!,)),
            content==null?const SizedBox():Positioned(
            top: 100,
              child: SizedBox(
                width: 350,
                child: Text(content! , style:const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0
                ),),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
