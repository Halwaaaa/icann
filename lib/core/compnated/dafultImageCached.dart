// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class DafultImageCached extends StatelessWidget {
//   const DafultImageCached({
//     super.key,
//     required this.url,
//     required this.raduis,
//   });
//   final String url;
//   final double raduis;
//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: url,
//       progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
//           height: raduis * 2,
//           width: raduis * 2,
//           child: CircularProgressIndicator(
//             value: downloadProgress.progress,
//           )),
//       errorWidget: (context, url, error) => Icon(
//         Icons.error,
//         size: raduis * 2,
//       ),
//       imageBuilder: (context, imageProvider) => CircleAvatar(
//           onBackgroundImageError: (exception, stackTrace) {},
//           backgroundImage: imageProvider,
//           radius: raduis),
//     );
//   }
// }
