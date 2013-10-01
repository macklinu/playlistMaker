import java.util.Map;
import java.io.*;

class Song {
  AudioPlayer mp3;
  AudioMetaData meta;

  Song(File f) {
    println("incoming file: " + f);
    boolean isMP3 = extension(f).equals("mp3");
    if (!isMP3) { 
      throw new Error("ERROR: File must be an .mp3");
    }
    String fname = f.toString();
    mp3 = minim.loadFile(fname);
    meta = mp3.getMetaData();
    println("made a song");
  }

  ///////////////////////
  // helpers and so on //
  ///////////////////////

  String extension(File f) {
    String fname = f.toString();
    String ext = "";
    int i = fname.lastIndexOf('.');
    int p = Math.max(fname.lastIndexOf('/'), fname.lastIndexOf('\\'));
    if (i > p) {
      ext = fname.substring(i+1);
    }
    return ext.toLowerCase();
  }
}

