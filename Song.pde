import java.util.Map;

class Song {
  StringDict info;
  AudioPlayer mp3;
  AudioMetaData meta;

  Song(File f) {
    String fname = f.toString();
    mp3 = minim.loadFile(fname);
    meta = mp3.getMetaData();
    info = new StringDict();
    info.set("title", meta.title());
    println("made a song");
    println(info.toString());
  }
}

