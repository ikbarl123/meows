part of 'pages.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({Key? key}) : super(key: key);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  final TextEditingController _msgTextController = new TextEditingController();
  FocusNode _writingTextFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
            child: FutureBuilder(
                builder: (ctx, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                  margin: EdgeInsets.only(top: 5),
                                  width: double.infinity,
                                  color: Colors.grey,
                                  child: Card(
                                      child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(children: [
                                              Container(
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                    Container(
                                                      width: 45,
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/images/user_pic.png"),
                                                              fit: BoxFit
                                                                  .cover)),
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("username",
                                                                style: darkPurpleTextFont.copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal)),
                                                            SizedBox(height: 5),
                                                            Text("3 hours ago",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left)
                                                          ],
                                                        ))
                                                  ]))
                                            ]),
                                          ),
                                          Container(
                                            child: Text(
                                                "asdsasdasdasdasdasdasd",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontSize: 20)),
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur fringilla quis odio egestas mattis. Donec at dui aliquet, egestas lacus a, congue lacus. Cras id tempor sem. Maecenas augue arcu, ",
                                              style: TextStyle(height: 1.5)),
                                          SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 6.0, bottom: 2.0),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: () => {},
                                                    child: Row(
                                                      children: <Widget>[
                                                        Icon(Icons.thumb_up,
                                                            size: 18,
                                                            color:
                                                                Colors.black),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0),
                                                          child: Text(
                                                            'Like ( 2 )',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Icon(Icons.comment_bank,
                                                            size: 18,
                                                            color:
                                                                Colors.black),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                            'Comment ( 2 )',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]),
                                          )
                                        ]),
                                  ))),
                            ),
                          ),
                          //  Container(
                          //    color:Colors.red,
                          //    child: Row(
                          //     children:[
                          //       Icon(Icons.pets_outlined),
                          //       Text("(5)")
                          //     ]
                          //   ),
                          //  ),

                          _buildTextComposer()
                        ]);
                  }
                  return Container();
                },
                future: PostServices().getPostDetail(1))),
      ),
    );
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                focusNode: _writingTextFocus,
                controller: _msgTextController,
                decoration:
                    new InputDecoration.collapsed(hintText: "Write a comment"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 2.0),
              child:
                  new IconButton(icon: new Icon(Icons.send), onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
