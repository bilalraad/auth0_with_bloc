import 'package:flutter/material.dart';
import 'package:oauth_with_bloc/data/models/breed.dart';

class BreedInfoCard extends StatelessWidget {
  final Breed breed;
  const BreedInfoCard({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: breed.image == null
                  ? const Center(child: Text('No Image Available'))
                  : Image.network(
                      breed.image ?? '',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Text(
            breed.name,
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            breed.description,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const Divider(),
          const SizedBox(height: 10),
          Text(breed.temperament),
          const SizedBox(height: 10),
          const Divider(),
          SizedBox(
            height: 100,
            child: GridView.count(
              // crossAxisSpacing: 1,
              mainAxisSpacing: 0,
              crossAxisCount: 2,
              childAspectRatio: 5,
              children: <Widget>[
                Text("Affection Level: ${breed.affectionLevel}/5"),
                Text("Child Friendly: ${breed.childFriendly}/5"),
                Text("Health Issues: ${breed.healthIssues}/5"),
                Text("Adaptability: ${breed.adaptability}/5"),
                Text("Shedding Level: ${breed.sheddingLevel}/5"),
                Text("Vocalisation: ${breed.vocalisation}/5"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
