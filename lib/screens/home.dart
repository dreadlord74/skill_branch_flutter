import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/screens/feed_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int curTab = 0;

  List<Widget> pages = [
    Feed(),
    Container(),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        itemCornerRadius: 8,
        curve: Curves.ease,
        onItemSelected: (int index){
          setState(() {
            curTab = index;
          });
        },
        items: [
          BottomNavyBarItem(
            asset: AppIcons.like,
            title: Text("Feed"),
            activeColor: AppColors.dodgerBlue,
            inactiveColor: AppColors.manatee,
          ),
          // BottomNavyBarItem(
          //   asset: AppIcons.like,
          //   title: Text("Search"),
          //   activeColor: AppColors.dodgerBlue,
          //   inactiveColor: AppColors.manatee
          // ),
          BottomNavyBarItem(
            asset: AppIcons.like_fill,
            title: Text("User"),
            activeColor: AppColors.dodgerBlue,
            inactiveColor: AppColors.manatee
          ),
        ],
      ),
      body: pages[curTab]
    );
  }
}

class BottomNavyBar extends StatelessWidget {

  final Color backgroundColor;
  final bool showElevation;
  final double containerHeight;
  final MainAxisAlignment mainAxisAlignment;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final double itemCornerRadius;

  final int currentTab;
  final Duration animationDuration;

  final Curve curve;

  BottomNavyBar({
    Key key,
    this.backgroundColor = Colors.white,
    this.showElevation = true,
    this.containerHeight = 56,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.items,
    this.onItemSelected,
    this.currentTab,
    this.animationDuration = const Duration(milliseconds: 270),
    this.itemCornerRadius = 8,
    this.curve
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          if (showElevation)
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 2
            )
        ]
      ),
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: containerHeight,
          padding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 8
          ),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: items.map((item){
              var index = items.indexOf(item);
              
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: ItemWidget(
                  isSelected: currentTab == index, 
                  item: item, 
                  backgroundColor: backgroundColor, 
                  duration: animationDuration, 
                  itemBorderRadius: itemCornerRadius,
                  curve: curve,
                ),
              );
            }).toList()
          ),
        )
      ),
    );
  }
}


class ItemWidget extends StatelessWidget {
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final Duration duration;
  final Curve curve;
  final double itemBorderRadius;


  ItemWidget({
    @required this.isSelected,
    @required this.item,
    @required this.backgroundColor,
    this.curve = Curves.linear,
    @required this.duration,
    @required this.itemBorderRadius
  }) :
      assert (duration != null, "duration is null"),
      assert (isSelected != null, "isSelected is null"),
      assert (item != null, "item is null"),
      assert (backgroundColor != null, "bgc is null"),
      assert (itemBorderRadius != null, "itemBorderRadius is null");

  
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(
        horizontal: 8
      ),
      duration: duration,
      curve: curve,
      width: isSelected ? 150 : MediaQuery.of(context).size.width - 150 - 30 * 2,
      decoration: BoxDecoration(
        color: isSelected ? item.activeColor.withOpacity(.2) : backgroundColor,
        borderRadius: BorderRadius.circular(itemBorderRadius)
      ),
      child: Row(
        children: <Widget>[
          Icon(
            item.asset,
            size: 20,
            color: isSelected ? item.activeColor : item.inactiveColor,
          ),
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 4
              ),
              child: DefaultTextStyle.merge(
                textAlign: item.textAlign, 
                child: item.title,
                maxLines: 1,
                style: TextStyle(
                  color: isSelected ? item.activeColor : item.inactiveColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}

class BottomNavyBarItem {
  final IconData asset;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;
  final TextAlign textAlign;

  BottomNavyBarItem({
    this.asset,
    this.title,
    this.activeColor,
    this.inactiveColor,
    this.textAlign
  }){
    assert (asset != null, "Asset is null!");
    // assert ()
  }
}