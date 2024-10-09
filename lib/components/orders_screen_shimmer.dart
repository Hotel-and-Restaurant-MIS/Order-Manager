import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OrderShimmerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Order details (left side)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shimmer for order number
                  Container(
                    width: 100.0,
                    height: 20.0,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10.0),
                  // Shimmer for table number
                  Container(
                    width: 80.0,
                    height: 20.0,
                    color: Colors.white,
                  ),
                ],
              ),
              // Shimmer for the status button (right side)
              Container(
                width: 60.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: 8, // Number of shimmer items
      itemBuilder: (context, index) {
        return OrderShimmerItem();
      },
    );
  }
}
