import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:ideashare/utils/extensions/text_style.dart';

class ImageViewerItem {
  ImageViewerItem({
    this.id,
    this.resource,
  });

  final String id;
  final ImageProvider resource;
}

class ImageViewer extends StatefulWidget {
  static Future<void> show({
    BuildContext context,
    final int index,
    List<ImageViewerItem> items,
    bool verticalGallery = false,
    Color backgroundColor,
  }) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageViewer(
          galleryItems: items,
          backgroundColor: backgroundColor,
          initialIndex: index,
          scrollDirection: verticalGallery ? Axis.vertical : Axis.horizontal,
        ),
      ),
    );
  }

  ImageViewer({
    this.backgroundColor,
    this.initialIndex = 0,
    @required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex) {
    this.backgroundColor = this.backgroundColor ?? Colors.black;
  }

  Color backgroundColor;
  final int initialIndex;
  final PageController pageController;
  final List<ImageViewerItem> galleryItems;
  final Axis scrollDirection;

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int currentIndex;
  bool showInfo = true;

  @override
  void initState() {
    currentIndex = widget.initialIndex;

    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showInfo
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.black.withOpacity(0.5),
                      Colors.transparent
                    ],
                  ),
                ),
              ),
            )
          : null,
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () => setState(() {
          this.showInfo = !this.showInfo;
        }),
        child: Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height,
              ),
              child: PhotoViewGallery.builder(
                scrollPhysics: const AlwaysScrollableScrollPhysics(),
                builder: _buildItem,
                itemCount: widget.galleryItems.length,
                loadingBuilder: (context, event) {
                  if (event == null) {
                    return Container(
                      color: widget.backgroundColor,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return Container(
                    color: widget.backgroundColor,
                  );
                },
                backgroundDecoration: BoxDecoration(
                  color: widget.backgroundColor,
                ),
                pageController: widget.pageController,
                onPageChanged: onPageChanged,
                scrollDirection: widget.scrollDirection,
              ),
            ),
            if (showInfo) ...[
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: Text(
                    "${currentIndex + 1} / ${widget.galleryItems.length}",
                    style: Theme.of(context).textTheme.bodyText1.toWhite(),
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final ImageViewerItem item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: item.resource,
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained,
      heroAttributes: PhotoViewHeroAttributes(tag: item.id),
    );
  }
}
