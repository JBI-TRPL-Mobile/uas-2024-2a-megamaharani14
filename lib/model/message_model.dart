class Message {
  final String sender;
  final String message;
  final String image;

  Message({
    required this.sender,
    required this.message,
    required this.image,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      sender: json['sender'],
      message: json['message'],
      image: json['image'],
    );
  }
}
