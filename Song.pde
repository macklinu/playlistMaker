import java.util.Map;
import java.io.*;
import ddf.minim.*;

class Song {
  AudioMetaData meta;
  SongView view;

  JSONObject info;
  String path, fname;

  Song(File f) {
    println("incoming file: " + f);
    fname = f.getName();
    path = f.getPath();
    meta = new Minim(playlistMaker.this)
      .loadFile(path)
        .getMetaData();
    println("made a song");
    view = new SongView(this);
    createJSONObject();
  }

  private void createJSONObject() {
    info = new JSONObject();
    // title
    String _title = meta.title().equals("") 
      ? this.fname // true: filename.mp3
      : meta.title(); // false: title tag
    String _author = meta.author().equals("") 
      ? "[unknown]" // true: blank
      : meta.author(); // false: author tag
    String _album = meta.album().equals("") 
      ? "" // true: blank
      : meta.album(); // false: album tag
    String _date = meta.date().toString().equals("") 
      ? "" // true: blank
      : meta.date(); // false: date tag
    // write everything to a JSON object
    info.setString("title", _title);
    info.setString("artist", _author);
    info.setString("album", _album);
    info.setString("date", _date);
    println(info.toString());
  }

  ///////////////////////
  // helpers and so on //
  ///////////////////////
}

