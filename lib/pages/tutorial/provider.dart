import 'package:wan_flutter/common/http/base_provider.dart';
import 'package:wan_flutter/common/http/base_response.dart';
import 'package:wan_flutter/pages/entity/article.dart';
import 'package:wan_flutter/pages/tutorial/entity/tutorial_entity.dart';

abstract class ITutorialProvider {
  Future<List<TutorialEntity>> getTutorialList();

  Future<PageList<Article>> getTutorialChapterList(String chapterId, int page);
}

class TutorialProvider extends BaseProvider implements ITutorialProvider {
  @override
  Future<List<TutorialEntity>> getTutorialList() =>
      get('/chapter/547/sublist/json').then((value) => value.toList(TutorialEntity.fromJson));

  @override
  Future<PageList<Article>> getTutorialChapterList(String chapterId, int page) =>
      get('/article/list/$page/json?cid=$chapterId&order_type=1')
          .then((value) => value.toPageList(Article.fromJson));
}
