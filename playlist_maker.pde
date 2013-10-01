import java.io.*;
import sojamo.drop.*;
import ddf.minim.*;

SDrop drop;
Minim minim;

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
  try {
    Song s = new Song(d.file());
  } 
  catch (Exception e) {
    println(e.getMessage());
  }
}

