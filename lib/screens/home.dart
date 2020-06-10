import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/screens/feed_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Widget> pages = [
    Feed(),
    Container(),
    Container()
  ];

  int currentTab = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        itemCornerRadius: 8,
        currentTab: currentTab,
        curve: Curves.ease,
        onItemSelected: (int itemIndex){
          setState(() {
            currentTab = itemIndex;
          });
        },
        items: [
          BottomNavyBarItem(
            asset: AppIcons.home,
            title: Text("Feed"),
            activeColor: AppColors.dodgerBlue,
            inactiveColor: AppColors.manatee
          ),
          BottomNavyBarItem(
            asset: AppIcons.home,
            title: Text("Search"),
            activeColor: AppColors.dodgerBlue,
            inactiveColor: AppColors.manatee
          ),
          BottomNavyBarItem(
            asset: AppIcons.home,
            title: Text("User"),
            activeColor: AppColors.dodgerBlue,
            inactiveColor: AppColors.manatee
          ),
        ],
      ),
      body: pages[currentTab],
    );
  }
}





class BottomNavyBar extends StatelessWidget {
  const BottomNavyBar({
    Key key,
    this.bgColor = Colors.white,
    this.showElevation = true,
    this.containerHeihgt = 56,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.items,
    this.onItemSelected,
    @required this.currentTab,
    this.animatioDuration = const Duration(milliseconds: 270),
    this.itemCornerRadius = 24,
    this.curve
  }) : super(key: key);

  final Color bgColor;
  final bool showElevation;
  final double containerHeihgt;
  final MainAxisAlignment mainAxisAlignment;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final int currentTab;
  final Duration animatioDuration;
  final double itemCornerRadius;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (showElevation) const BoxShadow(color: Colors.black12, blurRadius: 2)
        ]
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeihgt,
          padding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 8
          ),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: items.map((BottomNavyBarItem item){
              var index = items.indexOf(item);

              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: _ItemWidget(
                  animationDuretion: animatioDuration,
                  bgColor: bgColor,
                  isSelected: currentTab == index,
                  item: item,
                  itemCornerRadius: itemCornerRadius,
                  curve: curve,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}



class BottomNavyBarItem {
  BottomNavyBarItem({
    this.asset, 
    this.title, 
    this.activeColor, 
    this.inactiveColor, 
    this.textAlign
  }){
    assert (asset != null, "Asset is neull");
    assert (title != null, "Title is neull");
  }

  final IconData asset;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;
  final TextAlign textAlign;
}



class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    Key key,
    @required this.isSelected,
    @required this.bgColor,
    @required this.item,
    this.curve = Curves.linear,
    @required this.animationDuretion,
    @required this.itemCornerRadius
  }) 
    : assert(animationDuretion != null, "animationDuretion is null"),
    // assert(curve != null, "curve is null"),
    assert(isSelected != null, "isSelected is null"),
    assert(item != null, "item is null"),
    assert(bgColor != null, "bgColor is null"),
    assert(itemCornerRadius != null, "itemCornerRadius is null");

  final bool isSelected;
  final BottomNavyBarItem item;
  final Color bgColor;
  final Duration animationDuretion;
  final Curve curve;
  final double itemCornerRadius;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuretion,
      width: isSelected ? 150 : (MediaQuery.of(context).size.width - 150 - 8 * 4 - 4 * 2) / 2,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5
      ),
      curve: curve,
      decoration: BoxDecoration(
        color: isSelected ? item.activeColor.withOpacity(.2) : bgColor,
        borderRadius: BorderRadius.circular(itemCornerRadius)
      ),
      child: Row(
        children: <Widget>[
          Icon(
            item.asset,
            size: 20,
            color: isSelected ? item.activeColor : item.inactiveColor
          ),
          SizedBox(width: 4),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 4
              ),
              child: DefaultTextStyle.merge(
                child: item.title,
                textAlign: item.textAlign,
                maxLines: 1,
                style: TextStyle(
                  color: isSelected ? item.activeColor : item.inactiveColor,
                  fontWeight: FontWeight.bold,

                )
              )
            )
          )
        ],
      ),
    );
  }
}