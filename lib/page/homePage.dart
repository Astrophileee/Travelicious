import 'package:flutter/material.dart';
import '../model/foodModel.dart';
import '../model/destinationModel.dart';
import 'detailFoodPage.dart';
import 'foodPage.dart';
import 'destinationPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                        'Selamat Datang, Iqbal!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Apa Kabar?',
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
                    color: Color(0xFF4A4A4A),
                  ),
                ),
              ),
            ),
            SectionTitle(
              title: 'Popular Foods',
            ),
            FoodList(),
            SectionTitle(
              title: 'Popular Destinations',
            ),
            DestinationList(),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

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

class FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<foodModel> sortedFoodList = List.from(listFood);
    sortedFoodList.sort((a, b) => b.rate.compareTo(a.rate));
    List<foodModel> topRatedFood = sortedFoodList.take(5).toList();

    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: topRatedFood.length,
        itemBuilder: (context, index) {
          return FoodCard(food: topRatedFood[index]);
        },
      ),
    );
  }
}

class DestinationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<destinationModel> sortedDestinationList = List.from(listDestination);
    sortedDestinationList.sort((a, b) => b.rate.compareTo(a.rate));
    List<destinationModel> topRatedDestination =
        sortedDestinationList.take(5).toList();

    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: topRatedDestination.length,
        itemBuilder: (context, index) {
          return DestinationCard(destination: topRatedDestination[index]);
        },
      ),
    );
  }
}

class FoodCard extends StatefulWidget {
  final foodModel food;

  FoodCard({required this.food});

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    String shortLocation = widget.food.location.split(' ').take(7).join(' ');
    if (shortLocation.length > 20) {
      shortLocation = shortLocation.substring(0, 20) + '...';
    } else if (widget.food.location.split(' ').length > 7) {
      shortLocation += '...';
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailFoodPage(food: widget.food),
          ),
        );
      },
      child: Container(
        width: 150,
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
                    widget.food.image![0],
                    height: 90,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton(
                    icon: Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: isSaved ? Colors.yellow : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isSaved = !isSaved;
                      });
                    },
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
                        '${widget.food.rate.toStringAsFixed(1)} (${widget.food.review})',
                      ),
                    ],
                  ),
                  Text(
                    widget.food.name,
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

class DestinationCard extends StatefulWidget {
  final destinationModel destination;

  DestinationCard({required this.destination});

  @override
  _DestinationCardState createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    String shortLocation =
        widget.destination.location.split(' ').take(7).join(' ');
    if (shortLocation.length > 20) {
      shortLocation = shortLocation.substring(0, 20) + '...';
    } else if (widget.destination.location.split(' ').length > 7) {
      shortLocation += '...';
    }

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 150,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    widget.destination.image![0],
                    height: 90,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton(
                    icon: Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: isSaved ? Colors.yellow : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isSaved = !isSaved;
                      });
                    },
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
                        widget.destination.rate.toStringAsFixed(1),
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Text(
                    widget.destination.name,
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
