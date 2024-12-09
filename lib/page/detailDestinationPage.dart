import 'package:flutter/material.dart';
import '../model/destinationModel.dart';
import '../nav/bottnav.dart';
import 'dart:math';
import 'dart:async';

class DetailDestinationPage extends StatefulWidget {
  final destinationModel destination;

  DetailDestinationPage({required this.destination});

  @override
  _DetailDestinationPageState createState() => _DetailDestinationPageState();
}

class _DetailDestinationPageState extends State<DetailDestinationPage> {
  bool isSaved = false;
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < (widget.destination.image!.length - 1)) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Scaffold(
      backgroundColor: Color(0xFFF1FBFF),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.destination.image!.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        widget.destination.image![index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.destination.name,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.destination.description,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        widget.destination.location,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        "Open: ${widget.destination.timetable}",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, size: 14, color: Colors.yellow),
                              SizedBox(width: 4),
                              Text(
                                  '${widget.destination.rate} (${widget.destination.review} reviews)'),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.directions, color: Colors.blue),
                                Text('Direction',
                                    style: TextStyle(color: Colors.blue)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Review',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          TextButton.icon(
                            onPressed: () {
                            },
                            icon: Icon(Icons.edit_note_outlined,
                                color: Colors.black),
                            label: Text(
                              'Leave a Review',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors
                                  .white,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('lib/assets/images/iqbal.jpg'),
                                ),
                                title: Text('User $index'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Deskripsi bla bla bla'),
                                    SizedBox(height: 4),
                                    Text(
                                      '${random.nextInt(12) + 1} months ago',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ],
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text('${random.nextInt(5) + 1}'),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Divider(),
                      Text(
                        'Explore other',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listDestination.length,
                          itemBuilder: (context, index) {
                            if (listDestination[index].name ==
                                widget.destination.name) {
                              return SizedBox
                                  .shrink();
                            }
                            return DestinationCard(
                                destination: listDestination[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () =>
                    Navigator.pop(context), 
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_border,
                  color: isSaved ? Colors.yellow : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    isSaved = !isSaved;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final destinationModel destination;

  DestinationCard({required this.destination});

  @override
  Widget build(BuildContext context) {
    String shortLocation = destination.location.split(' ').take(7).join(' ');
    if (shortLocation.length > 20) {
      shortLocation =
          shortLocation.substring(0, 20) + '...'; 
    } else if (destination.location.split(' ').length > 7) {
      shortLocation += '...'; 
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailDestinationPage(destination: destination),
          ),
        );
      },
      child: Container(
        width: 160,
        height: 250,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    destination.image![0],
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Colors.yellow),
                      SizedBox(width: 4),
                      Text(
                          '${destination.rate.toStringAsFixed(1)} (${destination.review})'),
                    ],
                  ),
                  Text(
                    destination.name,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    shortLocation,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
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
