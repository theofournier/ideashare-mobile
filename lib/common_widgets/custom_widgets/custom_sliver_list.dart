import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({
    Key key,
    this.padding = const EdgeInsets.all(0),
    this.separated = false,
    this.separatorWidget = const SizedBox(
      height: 8,
    ),
    this.itemCount = 0,
    this.itemBuilder,
  }) : super(key: key);

  final EdgeInsets padding;
  final bool separated;
  final Widget separatorWidget;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding,
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (separated && !index.isEven) {
              return separatorWidget;
            }
            final int itemIndex = index ~/ 2;
            return itemBuilder != null ? itemBuilder(context, itemIndex) : Container();
          },
          semanticIndexCallback: (Widget widget, int localIndex) {
            if (localIndex.isEven) {
              return localIndex ~/ 2;
            }
            return null;
          },
          childCount: math.max(0, itemCount * 2 - 1),
        ),
      ),
    );
  }
}
