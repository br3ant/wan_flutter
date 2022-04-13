class OfficialTab {
  OfficialTab({
      this.author,
      this.courseId, 
      this.cover, 
      this.desc, 
      this.id, 
      this.lisense, 
      this.lisenseLink, 
      this.name, 
      this.order, 
      this.parentChapterId, 
      this.userControlSetTop, 
      this.visible,});

  OfficialTab.fromJson(dynamic json) {
    author = json['author'];
    courseId = json['courseId'];
    cover = json['cover'];
    desc = json['desc'];
    id = json['id'];
    lisense = json['lisense'];
    lisenseLink = json['lisenseLink'];
    name = json['name'];
    order = json['order'];
    parentChapterId = json['parentChapterId'];
    userControlSetTop = json['userControlSetTop'];
    visible = json['visible'];
  }
  String? author;
  List<dynamic>? children;
  int? courseId;
  String? cover;
  String? desc;
  int? id;
  String? lisense;
  String? lisenseLink;
  String? name;
  int? order;
  int? parentChapterId;
  bool? userControlSetTop;
  int? visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = author;
    map['courseId'] = courseId;
    map['cover'] = cover;
    map['desc'] = desc;
    map['id'] = id;
    map['lisense'] = lisense;
    map['lisenseLink'] = lisenseLink;
    map['name'] = name;
    map['order'] = order;
    map['parentChapterId'] = parentChapterId;
    map['userControlSetTop'] = userControlSetTop;
    map['visible'] = visible;
    return map;
  }

}