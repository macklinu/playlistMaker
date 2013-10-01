import java.util.Map;

class Song {
  StringDict info;
  
  Song(AudioMetaData meta) {
    info = new StringDict();
    info.set("title", meta.title());
    println("made a song");
    println(info.toString());
  }
  
}
