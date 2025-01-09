import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome William'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey[300],
              child: Center(
                child: Text('Image Placeholder', style: TextStyle(color: Colors.grey)),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Keep Moving Up',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do"'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('See All'),
                ),
              ],
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                CategoryChip(label: 'Development'),
                CategoryChip(label: 'IT & Software'),
                CategoryChip(label: 'UI/UX Design'),
                CategoryChip(label: 'Business'),
                CategoryChip(label: 'Finance & Business'),
                CategoryChip(label: 'Personal'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Top Courses',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 3 / 2,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[300],
                  child: Center(
                    child: Text('Course ${index + 1}', style: TextStyle(color: Colors.grey)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: navigasi(),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[200],
    );
  }
}

 BottomNavigationBar navigasi() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '', ),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
      ],
    );
  }
