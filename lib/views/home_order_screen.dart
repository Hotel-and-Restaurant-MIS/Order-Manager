import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_manager/constants/colours.dart';
import 'package:order_manager/constants/order_status.dart';
import 'package:order_manager/constants/text_constants.dart';
import 'package:order_manager/controllers/view/home_order_screen/order_list_builder.dart';

class HomeOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.0,
          title: Text(
            'Orders',
            style: TextConstants.kMainTextStyle(fontSize: 30.0),
          ),
          bottom: TabBar(

            labelColor: kButtonColour,
            dividerHeight: 2.0,
            indicatorWeight: 3.0,
            indicatorColor: kButtonColour,
            isScrollable: true,
            tabs: kOrderStatus.map<Widget>((status){
              return Tab(
                child: Container(alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 60.0),
                  height: 50,child: Text(status),),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: kOrderStatus
              .map<Widget>(
                (status) => OrderListBuilder.instance
                .buildListByStatus(status: status),
          )
              .toList(),
        ),

      ),
    );
  }
}
