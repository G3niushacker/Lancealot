import 'package:flutter/material.dart';
import 'package:lancelot/routes/routes_name.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  TextEditingController messageController = TextEditingController();
  double defaulfRaiting = 1.0;
  double textRaiting = 1.0;
  ratingText() {
    if (defaulfRaiting == 1.0) {
      setState(() {
        textRaiting = 1.0;
      });
    } else if (defaulfRaiting == 2.0) {
      setState(() {
        textRaiting = 2.0;
      });
    } else if (defaulfRaiting == 3.0) {
      textRaiting = 3.0;
    } else if (defaulfRaiting == 4.0) {
      textRaiting = 4.0;
    } else {
      textRaiting = 5.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("FeedBack"),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 5),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "images/profile.png",
                          fit: BoxFit.fill,
                          height: 120,
                          width: 120,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "John Doe",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "+1 568 236 5989",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothStarRating(
                      size: 40,
                      color: Colors.black,
                      borderColor: Colors.black,
                      rating: 0,
                      onRated: (val) {
                        setState(() {
                          setState(() {
                            ratingText();
                            defaulfRaiting = val;
                          });
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "$textRaiting",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your FeedBack to Guard",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: 5,
                  controller: messageController,
                  decoration: InputDecoration(
                      hintText: "Here's your feedback",
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, homeRoute);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: Colors.black,
                      )),
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  height: 50,
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
