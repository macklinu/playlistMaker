import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;
import sojamo.drop.*;


SDrop drop;

// Custom classes
Queue queue;

int bg = 0;

void setup() {
  size(300, 300);
  drop = new SDrop(this);
  Ani.init(this);

  queue = new Queue();
}

void draw() {
  background(bg);
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
        } 
        else {
          println("No mp3s in that folder... try again.");
        }
      } 
      else { // only one file was dropped
        if (extension(file).equals("mp3")) {
          queue.add(file);
          Ani.to(this, 1.0, "bg", random(255));
          
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

