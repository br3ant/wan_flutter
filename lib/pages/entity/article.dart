/// apkLink : ""
/// audit : 1
/// author : ""
/// canEdit : false
/// chapterId : 502
/// chapterName : "自助"
/// collect : false
/// courseId : 13
/// desc : ""
/// descMd : ""
/// envelopePic : ""
/// fresh : true
/// host : ""
/// id : 22003
/// link : "https://www.jianshu.com/p/30ad0f2fbf3b"
/// niceDate : "2小时前"
/// niceShareDate : "2小时前"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1648171302000
/// realSuperChapterId : 493
/// selfVisible : 0
/// shareDate : 1648171302000
/// shareUser : "hp1451193026"
/// superChapterId : 494
/// superChapterName : "广场Tab"
/// tags : []
/// title : "NDK-JNI-详解-1"
/// type : 0
/// userId : 2058
/// visible : 1
/// zan : 0

class Article {
  Article({
      String? apkLink, 
      int? audit, 
      String? author, 
      bool? canEdit, 
      int? chapterId, 
      String? chapterName, 
      bool? collect, 
      int? courseId, 
      String? desc, 
      String? descMd, 
      String? envelopePic, 
      bool? fresh, 
      String? host, 
      int? id, 
      String? link, 
      String? niceDate, 
      String? niceShareDate, 
      String? origin, 
      String? prefix, 
      String? projectLink, 
      int? publishTime, 
      int? realSuperChapterId, 
      int? selfVisible, 
      int? shareDate, 
      String? shareUser, 
      int? superChapterId, 
      String? superChapterName, 
      List<dynamic>? tags,
      String? title, 
      int? type, 
      int? userId, 
      int? visible, 
      int? zan,}){
    _apkLink = apkLink;
    _audit = audit;
    _author = author;
    _canEdit = canEdit;
    _chapterId = chapterId;
    _chapterName = chapterName;
    _collect = collect;
    _courseId = courseId;
    _desc = desc;
    _descMd = descMd;
    _envelopePic = envelopePic;
    _fresh = fresh;
    _host = host;
    _id = id;
    _link = link;
    _niceDate = niceDate;
    _niceShareDate = niceShareDate;
    _origin = origin;
    _prefix = prefix;
    _projectLink = projectLink;
    _publishTime = publishTime;
    _realSuperChapterId = realSuperChapterId;
    _selfVisible = selfVisible;
    _shareDate = shareDate;
    _shareUser = shareUser;
    _superChapterId = superChapterId;
    _superChapterName = superChapterName;
    _tags = tags;
    _title = title;
    _type = type;
    _userId = userId;
    _visible = visible;
    _zan = zan;
}

  Article.fromJson(dynamic json) {
    _apkLink = json['apkLink'];
    _audit = json['audit'];
    _author = json['author'];
    _canEdit = json['canEdit'];
    _chapterId = json['chapterId'];
    _chapterName = json['chapterName'];
    _collect = json['collect'];
    _courseId = json['courseId'];
    _desc = json['desc'];
    _descMd = json['descMd'];
    _envelopePic = json['envelopePic'];
    _fresh = json['fresh'];
    _host = json['host'];
    _id = json['id'];
    _link = json['link'];
    _niceDate = json['niceDate'];
    _niceShareDate = json['niceShareDate'];
    _origin = json['origin'];
    _prefix = json['prefix'];
    _projectLink = json['projectLink'];
    _publishTime = json['publishTime'];
    _realSuperChapterId = json['realSuperChapterId'];
    _selfVisible = json['selfVisible'];
    _shareDate = json['shareDate'];
    _shareUser = json['shareUser'];
    _superChapterId = json['superChapterId'];
    _superChapterName = json['superChapterName'];
    _tags = json['tags'];
    _title = json['title'];
    _type = json['type'];
    _userId = json['userId'];
    _visible = json['visible'];
    _zan = json['zan'];
  }
  String? _apkLink;
  int? _audit;
  String? _author;
  bool? _canEdit;
  int? _chapterId;
  String? _chapterName;
  bool? _collect;
  int? _courseId;
  String? _desc;
  String? _descMd;
  String? _envelopePic;
  bool? _fresh;
  String? _host;
  int? _id;
  String? _link;
  String? _niceDate;
  String? _niceShareDate;
  String? _origin;
  String? _prefix;
  String? _projectLink;
  int? _publishTime;
  int? _realSuperChapterId;
  int? _selfVisible;
  int? _shareDate;
  String? _shareUser;
  int? _superChapterId;
  String? _superChapterName;
  List<dynamic>? _tags;
  String? _title;
  int? _type;
  int? _userId;
  int? _visible;
  int? _zan;
Article copyWith({  String? apkLink,
  int? audit,
  String? author,
  bool? canEdit,
  int? chapterId,
  String? chapterName,
  bool? collect,
  int? courseId,
  String? desc,
  String? descMd,
  String? envelopePic,
  bool? fresh,
  String? host,
  int? id,
  String? link,
  String? niceDate,
  String? niceShareDate,
  String? origin,
  String? prefix,
  String? projectLink,
  int? publishTime,
  int? realSuperChapterId,
  int? selfVisible,
  int? shareDate,
  String? shareUser,
  int? superChapterId,
  String? superChapterName,
  List<String>? tags,
  String? title,
  int? type,
  int? userId,
  int? visible,
  int? zan,
}) => Article(  apkLink: apkLink ?? _apkLink,
  audit: audit ?? _audit,
  author: author ?? _author,
  canEdit: canEdit ?? _canEdit,
  chapterId: chapterId ?? _chapterId,
  chapterName: chapterName ?? _chapterName,
  collect: collect ?? _collect,
  courseId: courseId ?? _courseId,
  desc: desc ?? _desc,
  descMd: descMd ?? _descMd,
  envelopePic: envelopePic ?? _envelopePic,
  fresh: fresh ?? _fresh,
  host: host ?? _host,
  id: id ?? _id,
  link: link ?? _link,
  niceDate: niceDate ?? _niceDate,
  niceShareDate: niceShareDate ?? _niceShareDate,
  origin: origin ?? _origin,
  prefix: prefix ?? _prefix,
  projectLink: projectLink ?? _projectLink,
  publishTime: publishTime ?? _publishTime,
  realSuperChapterId: realSuperChapterId ?? _realSuperChapterId,
  selfVisible: selfVisible ?? _selfVisible,
  shareDate: shareDate ?? _shareDate,
  shareUser: shareUser ?? _shareUser,
  superChapterId: superChapterId ?? _superChapterId,
  superChapterName: superChapterName ?? _superChapterName,
  tags: tags ?? _tags,
  title: title ?? _title,
  type: type ?? _type,
  userId: userId ?? _userId,
  visible: visible ?? _visible,
  zan: zan ?? _zan,
);
  String? get apkLink => _apkLink;
  int? get audit => _audit;
  String? get author => _author;
  bool? get canEdit => _canEdit;
  int? get chapterId => _chapterId;
  String? get chapterName => _chapterName;
  bool? get collect => _collect;
  int? get courseId => _courseId;
  String? get desc => _desc;
  String? get descMd => _descMd;
  String? get envelopePic => _envelopePic;
  bool? get fresh => _fresh;
  String? get host => _host;
  int? get id => _id;
  String? get link => _link;
  String? get niceDate => _niceDate;
  String? get niceShareDate => _niceShareDate;
  String? get origin => _origin;
  String? get prefix => _prefix;
  String? get projectLink => _projectLink;
  int? get publishTime => _publishTime;
  int? get realSuperChapterId => _realSuperChapterId;
  int? get selfVisible => _selfVisible;
  int? get shareDate => _shareDate;
  String? get shareUser => _shareUser;
  int? get superChapterId => _superChapterId;
  String? get superChapterName => _superChapterName;
  List<dynamic>? get tags => _tags;
  String? get title => _title;
  int? get type => _type;
  int? get userId => _userId;
  int? get visible => _visible;
  int? get zan => _zan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apkLink'] = _apkLink;
    map['audit'] = _audit;
    map['author'] = _author;
    map['canEdit'] = _canEdit;
    map['chapterId'] = _chapterId;
    map['chapterName'] = _chapterName;
    map['collect'] = _collect;
    map['courseId'] = _courseId;
    map['desc'] = _desc;
    map['descMd'] = _descMd;
    map['envelopePic'] = _envelopePic;
    map['fresh'] = _fresh;
    map['host'] = _host;
    map['id'] = _id;
    map['link'] = _link;
    map['niceDate'] = _niceDate;
    map['niceShareDate'] = _niceShareDate;
    map['origin'] = _origin;
    map['prefix'] = _prefix;
    map['projectLink'] = _projectLink;
    map['publishTime'] = _publishTime;
    map['realSuperChapterId'] = _realSuperChapterId;
    map['selfVisible'] = _selfVisible;
    map['shareDate'] = _shareDate;
    map['shareUser'] = _shareUser;
    map['superChapterId'] = _superChapterId;
    map['superChapterName'] = _superChapterName;
    map['tags'] = _tags;
    map['title'] = _title;
    map['type'] = _type;
    map['userId'] = _userId;
    map['visible'] = _visible;
    map['zan'] = _zan;
    return map;
  }

}