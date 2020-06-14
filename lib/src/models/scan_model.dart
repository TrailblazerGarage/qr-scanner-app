class ScanModel {

  int id;
  String type;
  String content;

  ScanModel({
    this.id,
    this.type,
    this.content,
  }){
    this.type = (this.content.contains('http'))
                ? this.type = 'http'
                : this.type = 'geo';
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => new ScanModel(
    id    : json["id"],
    type  : json["type"],
    content : json["content"],
  );

  Map<String, dynamic> toJson() => {
    "id"    : id,
    "type"  : type,
    "content" : content,
  };
}
