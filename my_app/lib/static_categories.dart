import 'package:flutter/material.dart';

import 'cases_page.dart'; // Import the next screen

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  String? selectedCategory; // Default is null (No preselected category)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _categorySection("The peanuts", [
              _categoryItem("Market Sizing", "5 cases", Icons.book),
            ]),
            _categorySection("The challenge", [
              _categoryItem("Market Entry", "2 cases", Icons.bookmark),
              _categoryItem("Profitability", "3 cases", Icons.lightbulb),
              _categoryItem("M&A", "3 cases", Icons.attach_money),
              _categoryItem(
                "New product launch",
                "3 cases",
                Icons.new_releases,
              ),
            ]),
            _categorySection("The tough cookies", [
              _categoryItem("Non-profit", "Easy\n3 cases", Icons.business),
              _categoryItem("Pricing", "Medium\n3 cases", Icons.calculate),
            ]),
            // const Spacer(),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed:
                  selectedCategory != null
                      ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    CasesPage(category: selectedCategory!),
                          ),
                        );
                      }
                      : null, // Button disabled if no category is selected
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white, // Set text color to white
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Reduce roundness
                ),
              ),
              child: const Text(
                "Progress to case selection",
                style: TextStyle(
                  fontSize: 16, // Set font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categorySection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Column(children: items),
      ],
    );
  }

  Widget _categoryItem(String title, String subtitle, IconData icon) {
    bool isSelected = selectedCategory == title;

    return InkWell(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green[200] : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
