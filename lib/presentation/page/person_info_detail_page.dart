import 'package:flutter/material.dart';

class PersonInfoDetailPage extends StatelessWidget {
  const PersonInfoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String s) {
              switch (s) {
                case "Delete":
                  //TODO: delete this data
                  Navigator.of(context).pop();
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) {
              return ["Delete"]
                  .map(
                    (e) => PopupMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList();
            },
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 175,
            leading: const Spacer(),
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Center(
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage: AssetImage(
                                  "assets/images/default_avatar.png"),
                            ),
                          ),
                          Text(
                            "Test Person",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            "Nickname",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            "XX years old",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              //TODO: open other app
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                builder: (builder) {
                                  return Container(
                                    height: 350.0,
                                    color: Colors.transparent,
                                    child: const Center(
                                      child: Text("This is a modal sheet"),
                                    ),
                                  );
                                },
                              );
                            },
                            style: IconButton.styleFrom(
                              shape: const CircleBorder(),
                            ),
                            child: const Icon(Icons.contacts),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/edit");
                              //TODO: set this data to edit page
                            },
                            icon: const Icon(Icons.edit),
                            label: const Text("Edit"),
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: const Text("Birthday"),
                  subtitle: const Text("YY/ZZ (? days later)"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    //TODO: moves to the anniversary notification settings screen
                  },
                );
              },
              childCount: 25,
            ),
          )
        ],
      ),
    );
  }
}
