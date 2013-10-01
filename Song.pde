import java.util.Map;
import java.io.*;

class Song {
  StringDict info;
  AudioPlayer mp3;
  AudioMetaData meta;

  Song(File f) {
    if (f.isFile()) {
      boolean isMP3 = extension(f).equals("mp3");
      if (!isMP3) { 
        throw new Error("ERROR: File must be an .mp3");
      }
    }

    if (f.isDirectory()) { // this way we know it's a directory
      /*
      println("listing the directory");
       // list the directory, not recursive, with the File api. returns File[].
       println("\n\n### listFiles #############################\n");
       println(drop.listFiles());
       // list the directory recursively with listFilesAsArray. returns File[]
       println("\n\n### listFilesAsArray recursive #############################\n");
       println(d.listFilesAsArray(drop, true));
       // list the directory and control the depth of the search. returns File[]
       println("\n\n### listFilesAsArray depth #############################\n");
       println(d.listFilesAsArray(drop, 2));
       */

      // via http://wiki.processing.org/w/Listing_files
      // list the files in the data folder, passing the filter as parameter
      String[] filenames = f.list(mp3Filter);

      // get and display the number of jpg files
      println(filenames.length + " mp3 files in specified directory");

      // display the filenames
      for (int i = 0; i < filenames.length; i++) {
        println(filenames[i]);
      }
    }

    String fname = f.toString();
    mp3 = minim.loadFile(fname);
    meta = mp3.getMetaData();
    info = new StringDict();
    info.set("title", meta.title());
    println("made a song");
    println(info.toString());
  }

  String get(String query) {
    return info.get(query);
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

