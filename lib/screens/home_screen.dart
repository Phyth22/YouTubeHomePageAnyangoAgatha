import 'package:flutter/material.dart';
import '../widgets/app_bar.dart'; // Assuming you have a custom app bar
import '../widgets/video_card.dart'; // Assuming you have a custom video card

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(), // Use your custom app bar
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryChip("All"),
                  _buildCategoryChip("Music"),
                  _buildCategoryChip("Gaming"),
                  _buildCategoryChip("News"),
                  _buildCategoryChip("Nollywood"),
                  _buildCategoryChip("Mixes"),
                  _buildCategoryChip("Choirs"),
                ],
              ),
            ),
            const Divider(),

            // Video list section
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Videos",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 9, // Total number of video cards (updated to match image count)
              itemBuilder: (context, index) {
                // Define the image paths and titles
                List<String> imagePaths = [
                  'assets/images/food2.jpeg',
                  'assets/images/food3.jpeg',
                  'assets/images/food4.jpeg',
                  'assets/images/food5.jpeg',
                  'assets/images/food6.jpeg',
                  'assets/images/food7.jpeg',
                  'assets/images/food 10.jpeg',
                  'assets/images/food11.jpeg',
                  'assets/images/food12.jpeg',
                ];

                List<String> titles = [
                  'Food Video 2',
                  'Food Video 3',
                  'Food Video 4',
                  'Food Video 5',
                  'Food Video 6',
                  'Food Video 7',
                  'Food Video 10',
                  'Food Video 11',
                  'Food Video 12',
                ];

                // Return the VideoCard with the corresponding image and title
                return VideoCard(
                  imagePath: imagePaths[index],
                  title: titles[index],
                  subtitle: "Channel ${index + 1} • ${100 + index * 100}K views • ${index + 1} day(s) ago",
                );
              },
            ),

            const Divider(),

            // Shorts section
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Shorts",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    margin: const EdgeInsets.all(5),
                    color: const Color.fromARGB(255, 214, 213, 213),
                    child: Center(
                      child: Text(
                        "Short ${index + 1}",
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'You',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(label),
        backgroundColor: const Color.fromARGB(255, 248, 245, 245),
      ),
    );
  }
}
