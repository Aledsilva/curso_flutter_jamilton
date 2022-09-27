class PostDaLista{

  int _userId;
  int _id;
  String _title;
  String _body;

  PostDaLista(this._userId, this._id, this._title, this._body);

  //segundo exemplo de método Post
  Map toJson(){
    return{
        "userId": this._userId,
        "id": this._id,
        "title": this._title,
        "body": this._body,
    };
  }
  //////////

  String get body => _body;

  set body(String value) {
    _body = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }
}