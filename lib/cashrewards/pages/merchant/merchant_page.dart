import 'package:flutter/material.dart';

import 'merchant_online.dart';

class MerchantPage extends StatelessWidget {
  static const routeName = '/merchant';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // These are the slivers that show up in the "outer" scroll view.
          return <Widget>[
            SliverOverlapAbsorber(
              // This widget takes the overlapping behavior of the SliverAppBar,
              // and redirects it to the SliverOverlapInjector below. If it is
              // missing, then it is possible for the nested "inner" scroll view
              // below to end up under the SliverAppBar even when the inner
              // scroll view thinks it has not been scrolled.
              // This is not necessary if the "headerSliverBuilder" only builds
              // widgets that do not overlap the next sliver.
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                
                title: const Text('Books'), // This is the title in the app bar.
                pinned: true,
                expandedHeight: 150.0,
                // The "forceElevated" property causes the SliverAppBar to show
                // a shadow. The "innerBoxIsScrolled" parameter is true when the
                // inner scroll view is scrolled beyond its "zero" point, i.e.
                // when it appears to be scrolled below the SliverAppBar.
                // Without this, there are cases where the shadow would appear
                // or not appear inappropriately, because the SliverAppBar is
                // not actually aware of the precise position of the inner
                // scroll views.
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Featured'),
                    Tab(text: 'Nearby'),
                  ],
                  labelColor: Colors.deepOrange,
                  unselectedLabelColor: Colors.black,
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            Text('online'),
            Text('instore'),
          ]
        ),
      ),
    );
  }
}
