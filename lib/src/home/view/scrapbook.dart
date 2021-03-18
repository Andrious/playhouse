// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

class ScrapBookApp extends StatelessWidget {
  ScrapBookApp({Key key}) : super(key: key);

  final List<Map<String, dynamic>> collections = [
    {'title': 'Food joint', 'image': meal},
    {'title': 'Photos', 'image': images[1]},
    {'title': 'Travel', 'image': fishtail},
    {'title': 'Nepal', 'image': kathmandu2},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          leading: Container(),
        title: Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Design',
                style: theme.headline5,
              ),
            ),
            Text(
              '|',
              style: theme.headline4,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Build',
                style: theme.headline5,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(24),
          child: Row(
            children: [
              TextButton(onPressed: () {}, child: const Text('Inspiration')),
              TextButton(
                  onPressed: () {}, child: const Text('Site assessment')),
              TextButton(onPressed: () {}, child: const Text('Floor Plan')),
              TextButton(onPressed: () {}, child: const Text('Evaluation')),
            ],
          ),
        ),
      ),
      endDrawer: Container(),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: 3,
            itemBuilder: _mainListBuilder,
          ),
        ],
      ),
    );
  }

  Widget _mainListBuilder(BuildContext context, int index) {
    // if (index == 0) {
    //   return _buildHeader(context);
    // }
    // if (index == 0) {
    //   return _buildSectionHeader(context);
    // }
    if (index == 0) {
      return _buildCollectionsRow();
    }
    if (index == 1) {
      return Row(
//        padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(onPressed: () {}, child: const Text('All')),
          ElevatedButton(onPressed: () {}, child: const Text('Favorite')),
          ElevatedButton(onPressed: () {}, child: const Text('Incomplete')),
        ],
      );
    }
//    return _buildListItem();
    return Padding(
      padding: const EdgeInsets.all(26),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        shrinkWrap: true,
        children: const [
          Card(image: brocoli, title: 'Broccoli', price: '30'),
          Card(image: cabbage, title: 'Cabbage', price: '37'),
          Card(image: mango, title: 'Mango', price: '22'),
          Card(image: pineapple, title: 'Pineapple', price: '90'),
        ],
      ),
    );
  }

  Container _buildHeader(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 50),
        height: 240,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  top: 40, left: 40, right: 40, bottom: 10),
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 5,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Mebina Nepal',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('UI/UX designer | Foodie | Kathmandu'),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              title: const Text(
                                '302',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Posts'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 12)),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text(
                                '10.3K',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Followers'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 12)),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text(
                                '120',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Following'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 12)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Material(
                  elevation: 5,
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(avatars[0]),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Container _buildSectionHeader(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Collection',
              style: Theme.of(context).textTheme.headline6,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Create new',
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      );

  Container _buildCollectionsRow() => Container(
        color: Colors.white,
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: collections.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: 150,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(collections[index]['image'],
                                fit: BoxFit.cover))),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(collections[index]['title'],
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .merge(TextStyle(color: Colors.grey.shade600)))
                  ],
                ));
          },
        ),
      );

  Widget _buildListItem() => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(images[2], fit: BoxFit.cover),
        ),
      );
}

class Card extends StatelessWidget {
  const Card({Key key, this.image, this.title, this.price}) : super(key: key);
  final String image;
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) => Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6,
            ),
          ],
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // CachedNetworkImage(
              //   imageUrl: image,
              //   progressIndicatorBuilder: (context, url, downloadProgress) =>
              //       CircularProgressIndicator(value: downloadProgress.progress),
              //   errorWidget: (context, url, error) => const Icon(Icons.error),
              // ),
              Image.network(
                image,
                height: 80,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(top: 4),
                  color: Colors.deepOrange,
                  child: Text('\$ $price',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12))),
            ],
          ),
        ),
      );
}
