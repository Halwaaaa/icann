import 'package:flutter/cupertino.dart';
import 'package:ican/featuers/home/widget/Search.dart';
import 'package:ican/featuers/home/widget/categoryIcon.dart';

class SearchAndActeGory extends StatelessWidget {
  const SearchAndActeGory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: const Row(
        children: <Widget>[
          Expanded(flex: 5, child: SearchOfCoffe()),
          SizedBox(
            width: 20,
          ),
          Flexible(child: categoryIcon()),
        ],
      ),
    );
  }
}
