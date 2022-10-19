class Messages {
  Messages._internal();

  static final Messages _singleton = Messages._internal();

  factory Messages() => _singleton;

  static const $MessageNetwork network = $MessageNetwork();
  static const $MessageServer server = $MessageServer();
}

class $MessageNetwork {
  const $MessageNetwork();

  String get noConnection => "Check your internet connection and try again";
}


class $MessageServer {
  const $MessageServer();

  String get error =>
      "The server encountered an error and could not complete your request";
}
