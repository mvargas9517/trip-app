import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'model/card.dart';
import 'package:google_fonts/google_fonts.dart';


class LocationPage extends StatefulWidget {
  final Destination destination;

  LocationPage({this.destination});

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override

  final List <String> _places = <String>['Moraine Lake', 'Banff Park', 'Niagra Falls'];

  Widget build(BuildContext context) {
        return Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Stack(
                      children: <Widget>[ 
                      Container(
                      child: Hero(
                            tag: widget.destination.imageUrl,
                            child: ClipRRect(
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                child: Image.asset(widget.destination.imageUrl,
                                 fit: BoxFit.cover),
                      ),
                    ), 
                ),
              ),
              ClipRect(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.35),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0, left: 25.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30.0),
                                        color: Colors.black.withOpacity(0.3)
                                      ),
                                        child: Icon(
                                          MaterialIcons.chevron_left,
                                          size: 45.0,
                                          color: Colors.white,
                                        ),
                                    ),
                          ),
                          Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30.0),
                                        color: Colors.black.withOpacity(0.3)
                                      ),
                                        child: Icon(
                                          Foundation.star,
                                          size: 28.0,
                                          color: Colors.white,
                                        ),
                                    ),
                        ],
                      ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .38,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.destination.place,
                        style: GoogleFonts.lato(
                          fontSize: 55,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),),
                  SizedBox(height: MediaQuery.of(context).size.height * .02),
                        Row(
                          children: <Widget>[
                  Icon(
                  MaterialIcons.location_on,
                  size: 17.0,
                  color: Colors.white,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                   Text(widget.destination.attractions,
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 17.0
                   ),
                   ),
                   SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                   Text('attractions',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 17.0),),
                          ],
                        ),
                  SizedBox( height: 20,),
                      ],
                    ),
                  ),
                  Container(
                  width: double.infinity,
                  child: Container(
          height: 200.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
  padding: const EdgeInsets.only(left: 30),
  itemCount: _places.length,
  itemBuilder: (BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
            height: 180,
            width: 180,
            child:  Image.asset('images/canada$index.jpg', fit: BoxFit.fitHeight,),
      ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              color: Colors.black.withOpacity(0.3),
              height: 180,
              width: 180,
            ),
          ),
        ),
        Positioned(
          bottom: 45,
          left: 30,
          child: Text(_places[index],
          style: GoogleFonts.lato(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: 0.5,
          ),),
        ),
      ],
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
),
                
                   ),
                  ),
        Center(
        child: Icon(Entypo.chevron_thin_up,
        size: 30.0,
        color: Colors.white),
          ),
        SizedBox(height: 8),
        Center(
          child: Text('More',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          ),
        ),
                ],
              ),
            ], 
          ),
        ],
      ),
     ],
   ),
  ),
 ),
);
}
}