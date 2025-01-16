import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/featuers/home/Presentation/controol/archiveControll.dart';

class ArchiveMain extends StatelessWidget {
  const ArchiveMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArchiveControll>(
      init: ArchiveControll(),
      id: ArchiveControll.archive,
      builder: (archiveControll) => archiveControll
          .itemMoudlesArchive[archiveControll.indexArchiveMoudels],
    );
  }
}
