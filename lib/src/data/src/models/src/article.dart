import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Article extends ParseObject implements ParseCloneable {
  Article() : super(keyTableName);
  Article.clone() : this();

  /// Looks strangely hacky but due to Flutter not using reflection, we have to
  /// mimic a clone
  @override
  clone(Map<String, dynamic> map) => Article.clone()..fromJson(map);

  static const String keyTableName = 'Article';

  String? get title => get<String?>('title');
  set title(String? value) => set<String?>('title', value);

  String? get content => get<String?>('content');
  set content(String? value) => set<String?>('content', value);
}
