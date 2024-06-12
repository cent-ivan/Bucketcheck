import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddBucket extends StatefulWidget {
  const AddBucket({super.key});

  @override
  State<AddBucket> createState() => _AddBucketState();
}

class _AddBucketState extends State<AddBucket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Bucket"),
      ),

      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_bg.png"),
              fit: BoxFit.cover
            )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 35, 10, 20),
          child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
              color: Color.fromRGBO(164, 234, 205, 0.85),
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //add Input fields for adding a bucket list
                //Include putting checklists
                //After entering desired checklists, count the tiles and pass it to the bucket_viewModel to process progress text in BucketList model
              ],
            ),
          ),
        ),
      ),


    );
  }
}