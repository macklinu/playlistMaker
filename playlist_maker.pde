import sojamo.drop.*;
import ddf.minim.*;

SDrop drop;
Minim minim;

// Custom classes
Queue queue;

void setup() {
  drop = new SDrop(this);
  minim = new Minim(this);

  queue = new Queue();
}

void draw() {
}

////////////
// events //
////////////

void dropEvent(DropEvent d) {
  try {
    if (d.isFile()) {
      File file = d.file();
      if (file.isDirectory()) { //
        File[] filenames = file.listFiles(mp3Filter);
        // get and display the number of jpg files
        if (filenames.length > 0) {
          println("");
          println(filenames.length + " mp3 files in specified directory");
          // add each mp3 to queue
          for (File f : filenames) {
            queue.add(f);
          }
        } else {
          println("No mp3s in that folder... try again.");
        }
      } 
      else { // only one file was dropped
        if (extension(file).equals("mp3")) {
          queue.add(file);
        } 
        else {
          println("didn't make a song on that drop... need an mp3");
        }
      }
    }
  } 
  catch (Error e) {
    println(e.getMessage());
  }
}

// a filter that returns true if file's extension is .mp3
FilenameFilter mp3Filter = new java.io.FilenameFilter() {
  boolean accept(File dir, String name) {
    return name.toLowerCase().endsWith(".mp3");
  }
};

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

