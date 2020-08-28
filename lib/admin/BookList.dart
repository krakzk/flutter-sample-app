import 'package:flutter/material.dart';
import 'package:sample/admin/ReviewPage.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}


class _BookListState extends State<BookList> {
  final List<ListItem> items = [
    MessageItem(01, "The Alchemist", "The Alchemist follows the journey of an Andalusian shepherd boy named Santiago. Believing a recurring dream to be prophetic, he asks a Gypsy fortune teller in the nearby town about its meaning. The woman interprets the dream as a prophecy telling the boy that he will discover a treasure at the Egyptian pyramids"),
    MessageItem(02, "The Kite Runner", "The Kite Runner is an inspiring and powerful novel about a Pashtun named Amir who looks back on his life during his transition from childhood into adulthood. Amir grew up in a lavish and rich district of Kabul, Afghanistan")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Library'
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildBody(context),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewPage(
                  id: item.getId(),
                  title: item.getTitle()
                )));
              },
            );
          },
        ),
      ),
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  //To store the book id
  int getId();
  String getTitle();

  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildBody(BuildContext context);
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final int id;
  final String title;
  final String body;

  MessageItem(this.id, this.title, this.body);

  int getId() {
    return id;
  }

  String getTitle() {
    return title;
  }

  Widget buildTitle(BuildContext context) => Text(
    title,
    style: TextStyle(
        color: Colors.black,
        fontSize: 25
      ),
    );

  Widget buildBody(BuildContext context) => Text(
    body,
    style: TextStyle(
        color: Colors.black,
        fontSize: 15
      ),
    );
}
