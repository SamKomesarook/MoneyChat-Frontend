class MessageData {
  String avatar;
  String title;
  String subTitle;
  DateTime time;
  MessageType type;

  MessageData(this.avatar, this.title, this.subTitle, this.time, this.type);
}

enum MessageType { SYSTEM, PUBLIC, CHAT, GROUP }

List<MessageData> messageData = [
  new MessageData(
      "https://www.biography.com/.image/c_fill%2Ccs_srgb%2Cfl_progressive%2Ch_400%2Cq_auto:good%2Cw_620/MTU2MTUyNzU2NTM1NTY3NjI5/paris-jackson-attends-the-59th-grammy-awards-at-staples-center-on-february-12-2017-in-los-angeles-california-photo-by-frazer-harrison_getty-images-square.jpg",
      "Jackson",
      "Hello guys",
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      "https://www.biography.com/.image/c_fill%2Ccs_srgb%2Cfl_progressive%2Ch_400%2Cq_auto:good%2Cw_620/MTU2MTUyNzU2NTM1NTY3NjI5/paris-jackson-attends-the-59th-grammy-awards-at-staples-center-on-february-12-2017-in-los-angeles-california-photo-by-frazer-harrison_getty-images-square.jpg",
      "Jackson",
      "Hello guys",
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      "https://www.biography.com/.image/c_fill%2Ccs_srgb%2Cfl_progressive%2Ch_400%2Cq_auto:good%2Cw_620/MTU2MTUyNzU2NTM1NTY3NjI5/paris-jackson-attends-the-59th-grammy-awards-at-staples-center-on-february-12-2017-in-los-angeles-california-photo-by-frazer-harrison_getty-images-square.jpg",
      "Jackson",
      "Hello guys",
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      "https://www.biography.com/.image/c_fill%2Ccs_srgb%2Cfl_progressive%2Ch_400%2Cq_auto:good%2Cw_620/MTU2MTUyNzU2NTM1NTY3NjI5/paris-jackson-attends-the-59th-grammy-awards-at-staples-center-on-february-12-2017-in-los-angeles-california-photo-by-frazer-harrison_getty-images-square.jpg",
      "Jackson",
      "Hello guys",
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData(
      "https://www.biography.com/.image/c_fill%2Ccs_srgb%2Cfl_progressive%2Ch_400%2Cq_auto:good%2Cw_620/MTU2MTUyNzU2NTM1NTY3NjI5/paris-jackson-attends-the-59th-grammy-awards-at-staples-center-on-february-12-2017-in-los-angeles-california-photo-by-frazer-harrison_getty-images-square.jpg",
      "Jackson",
      "Hello guys",
      new DateTime.now(),
      MessageType.CHAT),
];
