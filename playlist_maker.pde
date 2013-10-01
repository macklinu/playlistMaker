import java.io.*;
import sojamo.drop.*;
import ddf.minim.*;

SDrop drop;
Minim minim;
AudioPlayer mp3;
AudioMetaData meta;

void setup() {
  drop = new SDrop(this);
  minim = new Minim(this);
}

void draw() {
}

////////////
// events //
////////////

void dropEvent(DropEvent d) {
  if (d.isFile()) {
    // java.io.File
    File drop = d.file();
    println("\nisDirectory ? "+drop.isDirectory()+"  /  isFile ? "+drop.isFile());

    if (drop.isFile()) {
      // via http://wiki.processing.org/w/Listing_files
      // list the files in the data folder, passing the filter as parameter
      String[] filenames = drop.list(mp3Filter);
      // unnecessarily verbose!
      println(split(drop.toString(), '.')[split(drop.toString(), '.').length-1]);
      // here's the idea
      // probably going to throw an exception from the Song class,
      // catch the exception in the main
      try {
        if (drop.toString().toLowerCase().endsWith(".mp3")) {
          Song s = new Song(loadfile(drop));
        } 
        else {
          println("Song not created.");
          throw new Exception("ERROR: File must be an .mp3");
        }
      } 
      catch (Exception e) {
        println(e.getMessage());
      }

      // get and display the number of jpg files
      println(filenames.length + " mp3 files in specified directory");

      // display the filenames
      for (int i = 0; i < filenames.length; i++) {
        println(filenames[i]);
      }
    }

    if (drop.isDirectory()) { // this way we know it's a directory
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
      String[] filenames = drop.list(mp3Filter);

      // get and display the number of jpg files
      println(filenames.length + " mp3 files in specified directory");

      // display the filenames
      for (int i = 0; i < filenames.length; i++) {
        println(filenames[i]);
      }
    }
  }
}

// let's set a filter (which returns true if file's extension is .jpg)
FilenameFilter mp3Filter = new java.io.FilenameFilter() {
  boolean accept(File dir, String name) {
    return name.toLowerCase().endsWith(".mp3");
  }
};

AudioMetaData loadfile(File f) {
  String fname = f.toString();
  mp3 = minim.loadFile(fname);
  meta = mp3.getMetaData();
  return meta;
}

