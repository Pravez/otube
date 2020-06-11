class Instance {
  static const all = [
    "invidio.us",
    "invidious.snopyta.org",
    "vid.wxzm.sx",
    "invidiou.sh",
    "tube.poal.co",
    "yt.elukerio.org",
    "invidious.drycat.fr",
    "yt.lelux.fi",
    "watch.nettohikari.com",
    "invidious.ggc-project.de",
  ];

  // TODO change to have one object per instance keeping up the last time it was detected alive etc ...
  static String current = "invidious.snopyta.org";

  static get() => "https://$current/api/v1/";

  static changeInstance() {
    current = all.firstWhere((element) => element != current);
  }
}
