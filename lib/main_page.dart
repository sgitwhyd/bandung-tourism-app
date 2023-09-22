import 'package:flutter/material.dart';
import 'package:just_learn/detail_screen.dart';
import 'package:just_learn/model/tourism_place.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wisata Bandung'),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints contraints) {
            if (contraints.maxWidth <= 600) {
              return const TourismPlaceList();
            } else if (contraints.maxWidth <= 1200) {
              return const TourismPlaceGrid(
                gridCount: 4,
              );
            } else {
              return const TourismPlaceGrid(
                gridCount: 6,
              );
            }
          },
        ));
  }
}

class TourismPlaceList extends StatelessWidget {
  const TourismPlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(
                place: place,
              );
            }));
          },
          child: Card(
              child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(place.imageAsset),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(place.name, style: const TextStyle(fontSize: 16.0)),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(place.location)
                    ],
                  ),
                ),
              )
            ],
          )),
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}

class TourismPlaceGrid extends StatelessWidget {
  final int gridCount;

  const TourismPlaceGrid({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: tourismPlaceList.map(
            (place) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) {
                    return DetailScreen(place: place);
                  }));
                },
                child: Card(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Image.asset(
                      place.imageAsset,
                      fit: BoxFit.cover,
                    )),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        place.name,
                        style: const TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(place.location),
                    )
                  ],
                )),
              );
            },
          ).toList()),
    );
  }
}
