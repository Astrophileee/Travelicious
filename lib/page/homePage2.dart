import 'package:flutter/material.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1FBFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('lib/assets/images/iqbal.jpg'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome back, Iqbal!',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'How Are you?',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Travelicious',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A4A4A)),
                ),
              ),
            ),
            SectionTitle(title: 'Popular Foods'),
            FoodSwipeableStack(),
            SectionTitle(title: 'Popular Destinations'),
            DestinationSwipeableStack(),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class FoodSwipeableStack extends StatelessWidget {
  final List<String> foods = [
    'lib/assets/images/ujang.jpg',
    'lib/assets/images/ujang.jpg',
    'lib/assets/images/ujang.jpg',
    'lib/assets/images/ujang.jpg',
    'lib/assets/images/ujang.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 20,
          child: Row(
            children: [
              Icon(Icons.swipe_left, color: Colors.grey, size: 16),
              SizedBox(width: 4),
              Text("Swipe", style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
        Container(
          height: 250,
          child: SwipeableCardsSection(
            context: context,
            items: foods.map((food) => FoodCard(imagePath: food)).toList(),
          ),
        ),
        Positioned(
          right: 20,
          child: Row(
            children: [
              Text("Swipe", style: TextStyle(color: Colors.grey, fontSize: 12)),
              SizedBox(width: 4),
              Icon(Icons.swipe_right, color: Colors.grey, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class DestinationSwipeableStack extends StatelessWidget {
  final List<String> destinations = [
    'lib/assets/images/cibodas.jpg',
    'lib/assets/images/cibodas.jpg',
    'lib/assets/images/cibodas.jpg',
    'lib/assets/images/cibodas.jpg',
    'lib/assets/images/cibodas.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 20,
          child: Row(
            children: [
              Icon(Icons.swipe_left, color: Colors.grey, size: 16),
              SizedBox(width: 4),
              Text("Swipe", style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
        Container(
          height: 250,
          child: SwipeableCardsSection(
            context: context,
            items: destinations
                .map((destination) => DestinationCard(imagePath: destination))
                .toList(),
          ),
        ),
        Positioned(
          right: 20,
          child: Row(
            children: [
              Text("Swipe", style: TextStyle(color: Colors.grey, fontSize: 12)),
              SizedBox(width: 4),
              Icon(Icons.swipe_right, color: Colors.grey, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class FoodCard extends StatefulWidget {
  final String imagePath;

  const FoodCard({Key? key, required this.imagePath}) : super(key: key);

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool _isSaved = false;

  void _toggleSave() {
    setState(() {
      _isSaved = !_isSaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  widget.imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Tomoro Coffee',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Jl. Suroso, Pamoyanan',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14, color: Colors.yellow),
                        SizedBox(width: 4),
                        Text('4.6', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: Icon(
                Icons.bookmark,
                color: _isSaved ? Colors.yellow : Colors.white,
              ),
              onPressed: _toggleSave,
            ),
          ),
          // Right-bottom arrow button
          Positioned(
            bottom: 10,
            right: 10,
            child: IconButton(
              icon: Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.orange,
                size: 30,
              ),
              onPressed: () {
                // Action to perform when the arrow button is clicked
                print("Arrow button clicked");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DestinationCard extends StatefulWidget {
  final String imagePath;

  const DestinationCard({Key? key, required this.imagePath}) : super(key: key);

  @override
  _DestinationCardState createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  bool _isSaved = false;

  void _toggleSave() {
    setState(() {
      _isSaved = !_isSaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  widget.imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Taman Bunga',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Jl. Suroso, Pamoyanan',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14, color: Colors.yellow),
                        SizedBox(width: 4),
                        Text('4.6', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: Icon(
                Icons.bookmark,
                color: _isSaved ? Colors.yellow : Colors.white,
              ),
              onPressed: _toggleSave,
            ),
          ),
          // Right-bottom arrow button
          Positioned(
            bottom: 10,
            right: 10,
            child: IconButton(
              icon: Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.orange,
                size: 30,
              ),
              onPressed: () {
                // Action to perform when the arrow button is clicked
                print("Arrow button clicked");
              },
            ),
          ),
        ],
      ),
    );
  }
}
