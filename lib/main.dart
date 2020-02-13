import 'package:flutter/material.dart';
import 'model/card.dart';
import 'location_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

main() {
  runApp(MaterialApp(home:Homepage(),
  ));
}

class Homepage extends StatefulWidget {



  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> 
        with SingleTickerProviderStateMixin {
          PageController _pageController;
          int currentPage = 0;

          final List<String> cities = <String>['Paris', 'Moscow', 'Norway'];
          final List<String> imgs = <String> ['images/card0.png', 'images/card1.png', 'images/card2.png'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }


  @override
  Widget build(BuildContext context) {

    // final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return MaterialApp(
        color: Colors.yellow,
        home: DefaultTabController(
          length: 3,
          child: new Scaffold(
            body: TabBarView(
                children: [
                  // First Page
                  Container(
                    color: Colors.white,
                    child: SafeArea(
                        child: Stack(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: _height * 0.03),
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Your next trip',
                                          style: GoogleFonts.lato(
                                            fontSize: 35.0,
                                            fontWeight: FontWeight.w600
                                          ),),
                                        ],
                          ),
                              ),
                              SizedBox(height: _height * 0.03),
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0, right: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Top destinations',
                                    style: GoogleFonts.lato(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey
                                    ),),
                                    Text('See all',
                                    style: GoogleFonts.lato(
                                      fontSize: 18.0,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.teal[800]
                                    ),),
                                  ],
                                ),
                              ),
              SizedBox(height: _height * 0.02),
              Container(
                height: _height * 0.38,
                color: Colors.white,
                width: double.infinity,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemCount: destinations.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _tripCard(index);
                  },
                ),
              ),
              SizedBox(height: _height * 0.035),
               Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Beautiful cities',
                          style: GoogleFonts.lato(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey
                          ),),
                           Text('See all',
                          style: GoogleFonts.lato(
                            fontSize: 18.0,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w700,
                            color: Colors.teal[800]
                          ),),
                         ],
                       ),
                     ),
                     SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: Container(
          height: 210.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
  padding: const EdgeInsets.only(left: 30),
  itemCount: cities.length,
  itemBuilder: (BuildContext context, int index) {
    return Stack(
      children: <Widget>[
          ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
            color: Colors.grey[300],
            height: 180,
            width: 180,
            child:  Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Image.asset('images/card$index.png', height: 100),
            ),
      ),
          ),
        ),
        Positioned(
          bottom: 45,
          left: 50,
          width: 200,
          child: Text(cities[index],
          style: GoogleFonts.lato(
            fontSize: 30,
            fontWeight: FontWeight.w800
          )),
        ),
      ],
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
),
                
                   ),
                  ),
                  ],
                 ), 
                ],
               ),
              ),             
             ),
                  new Container(color: Colors.orange,),
                  new Container(
                    color: Colors.lightGreen,
                  ),
                ],
              ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
              child: new TabBar(
                tabs: [
                  Tab(
                    icon: new Icon(Fontisto.search, size: 28.0),
                  ),
                  Tab(
                    icon: new Icon(Feather.star, size: 30.0),
                  ),
                  Tab(
                    icon: new Icon(Feather.user, size: 30.0),
                  )
                ],
                labelColor: Colors.teal[800],
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.all(5.0),
                indicatorColor: Colors.transparent,
                labelPadding: EdgeInsets.symmetric(vertical: 8.0),
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      );
  }

  _tripCard(int index) {

    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        return Center(
          child: SizedBox(
            height: Curves.easeIn.transform(value) * 350.0,
            width: Curves.easeIn.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LocationPage(destination: destinations[index]),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Stack(
                children: <Widget>[
                  Hero(
                      tag: destinations[index].imageUrl,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          height: _height * 0.5,
                          width: _width * 0.8,
                          child: Image.asset('images/location$index.jpg', fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          height: _height * 0.5,
                          color: Colors.black.withOpacity(0.15),
                        ),
                      ),
                  Positioned(
                    left: 25.0,
                    top: 25.0,
                    child: Container(
                      height: _height * .045,
                      width: _width * .1,
                      child: Icon(Feather.star,
                      color: Colors.white.withOpacity(0.7)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black.withOpacity(0.25)                        
                      ),
                    ),
                  ),
                  Positioned(
                    left: 25.0,
                    bottom: 50.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            destinations[index].place,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 45.0,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                            ),
                          ),
                          SizedBox(height: _height * 0.01),
                        Row(
                          children: <Widget>[
                            Icon(MaterialIcons.location_on,
                            color: Colors.white,
                            size: 18.0),
                            SizedBox(width: _width * 0.01),
                            Text(destinations[index].attractions, 
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400
                            ),),
                            SizedBox(width: _width * 0.01),
                            Text('attractions', 
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}