import 'package:dog_breeds_app/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class ImagesPageView extends StatelessWidget {
  final List<String> imageUrls;

  ImagesPageView(this.imageUrls);

  final PageController _controller = PageController();
  final _pageIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          onPageChanged: (page) => _pageIndexNotifier.value = page,
          scrollDirection: Axis.horizontal,
          controller: _controller,
          itemBuilder: (context, page) {
            return CustomImage(imageUrls[page]);
          },
          itemCount: imageUrls.length,
        ),
        PageViewIndicator(
          pageIndexNotifier: _pageIndexNotifier,
          length: imageUrls.length,
          normalBuilder: (animationController, index) => Circle(
            size: 8, color: Colors.black87,
          ),
          highlightedBuilder: (animationController, index) => ScaleTransition(
            scale: CurvedAnimation(
                parent: animationController,
                curve: Curves.ease
            ),
            child: Circle(
              size: 12,
              color: Theme.of(context).primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
