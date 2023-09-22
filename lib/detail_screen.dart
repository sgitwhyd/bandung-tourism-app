import 'package:flutter/material.dart';
import 'package:just_learn/model/tourism_place.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints contraints) {
        if (contraints.maxWidth <= 800) {
          return DetailPageMobile(place: place);
        } else {
          return DetailPageWeb(place: place);
        }
      },
    );
  }
}

class DetailPageMobile extends StatelessWidget {
  final TourismPlace place;

  const DetailPageMobile({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: [
              Image.asset(place.imageAsset),
              SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                              color: Colors.white,
                            ),
                          ),
                          const FavoriteButton()
                        ],
                      )))
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Text(
              place.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Staatliches'),
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Icon(Icons.calendar_today),
                      const SizedBox(height: 8.0),
                      Text(
                        place.openDays,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.access_time),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        place.openTime,
                        style: informationTextStyle,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.monetization_on_rounded),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        place.ticketPrice,
                        style: informationTextStyle,
                      )
                    ],
                  )
                ],
              )),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              place.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16.0, fontFamily: 'Oxygen'),
            ),
          ),
          SizedBox(
            height: 150.0,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(url),
                      ));
                }).toList()),
          )
        ],
      ),
    ));
  }
}

class DetailPageWeb extends StatefulWidget {
  final TourismPlace place;
  const DetailPageWeb({super.key, required this.place});

  @override
  State<DetailPageWeb> createState() => _DetailPageWebState();
}

class _DetailPageWebState extends State<DetailPageWeb> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 64,
          ),
          child: Center(
            child: SizedBox(
              width: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            return Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                      const SizedBox(
                        width: 24,
                      ),
                      const Text(
                        'Wisata Bandung',
                        style: TextStyle(
                          fontFamily: 'Staatliches',
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              widget.place.imageAsset,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Scrollbar(
                              controller: _scrollController,
                              child: Container(
                                height: 150,
                                padding: const EdgeInsets.only(bottom: 16),
                                child: ListView(
                                    controller: _scrollController,
                                    scrollDirection: Axis.horizontal,
                                    children:
                                        widget.place.imageUrls.map((image) {
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(image),
                                        ),
                                      );
                                    }).toList()),
                              ))
                        ],
                      )),
                      const SizedBox(width: 32),
                      Expanded(
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  child: Text(
                                    widget.place.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontFamily: 'Staatliches'),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.calendar_today),
                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                        Text(
                                          widget.place.openDays,
                                          style: informationTextStyle,
                                        )
                                      ],
                                    ),
                                    const FavoriteButton()
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.access_time),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      widget.place.openTime,
                                      style: informationTextStyle,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.monetization_on_rounded),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      widget.place.ticketPrice,
                                      style: informationTextStyle,
                                    )
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Text(
                                    widget.place.description,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                        fontSize: 16, fontFamily: 'Oxygen'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ));
  }
}
