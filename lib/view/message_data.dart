class MessageData {
  String avatar;
  String title;
  String subTitle;
  DateTime time;
  MessageType type;

  MessageData(this.avatar, this.title, this.subTitle, this.time, this.type);

}
enum MessageType {
  SYSTEM,
  PUBLIC,
  CHAT,
  GROUP
}
List<MessageData> messageData = [
  new MessageData("https://www.biography.com/.image/c_fill%2Ccs_srgb%2Cfl_progressive%2Ch_400%2Cq_auto:good%2Cw_620/MTU2MTUyNzU2NTM1NTY3NjI5/paris-jackson-attends-the-59th-grammy-awards-at-staples-center-on-february-12-2017-in-los-angeles-california-photo-by-frazer-harrison_getty-images-square.jpg",
    "Jackson",
    "Hello guys",
    new DateTime.now(),
    MessageType.CHAT),
  new MessageData("https://i.pinimg.com/originals/dd/e4/da/dde4da8175c71a2559bba80224818f82.jpg",
      "Batman",
      "Tonight, I'm the Law!",
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData("https://pyxis.nymag.com/v1/imgs/0a8/5d1/3139b0b2fc427ff34fe5394bd1625d8527-2019-critics-joker.rsquare.w700.jpg",
      "Joker",
      "The worst part of having a mental illness is people expect you to behave as if you don’t.",
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData("https://www.biography.com/.image/t_share/MTUzMzQzOTkxMDAwMDgxNzA2/jason-statham-attends-the-press-conference-of-director-f-gary-grays-film-the-fate-of-the-furious-on-march-23-2017-in-beijing-china-photo-by-vcg_vcg-via-getty-images-square.jpg",
      "Jason Statham",
      "Pulling a trigger is easy!",
      new DateTime.now(),
      MessageType.CHAT),
  new MessageData("https://cdn.britannica.com/12/66012-050-F8306052/Tom-Hanks-Saving-Private-Ryan.jpg",
      "Captain Miller",
      "James Francis Ryan from Iowa?",
      new DateTime.now(),
      MessageType.CHAT),
];


