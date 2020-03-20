import ddf.minim.signals.*; 
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

// http://code.compartmental.net/minim/index.html

Minim minim;
FFT fft;
AudioPlayer Fresku;
AudioPlayer MacMiller;
AudioPlayer Maan;
AudioPlayer AmberRun;
AudioPlayer Fisher;
AudioPlayer NWA;
AudioPlayer BMTH;
AudioPlayer LinkinPark;
AudioPlayer U2;
BeatDetect beatFresku;
BeatDetect beatMacMiller;
BeatDetect beatMaan;
BeatDetect beatAmberRun;
BeatDetect beatFisher;
BeatDetect beatNWA;
BeatDetect beatBMTH;
BeatDetect beatLinkinPark;
BeatDetect beatU2;
BeatListener bl;

// Character + Character movement
float characterX;
float characterY;
float xOffset = 0.0; 
float yOffset = 0.0; 
float easing = 0.05;
boolean overCharacter = false;
boolean locked = false;
int characterSize = 75;
int speed = 10;


// Keys
char leftKey = 37;
char upKey = 38;
char rightKey = 39;
char downKey = 40;

// Bottom text
String instructionsBase = "Move the cursor inside an album with the ARROW keys / drag & drop";
String instructions = instructionsBase;
color white = #FFFFFF;

// Load album cover images + create a boxes/placeholders
Album album01 = new Album(20,20); 
PImage FreskuCover;

Album album02 = new Album(300,20);
PImage MacMillerCover;

Album album03 = new Album(580,20);
PImage MaanCover;

Album album04 = new Album(20,260);
PImage AmberRunCover;

Album album05 = new Album(300,260);
PImage FisherCover;

Album album06 = new Album(580,260);
PImage NWACover;

Album album07 = new Album(20,500);
PImage BMTHCover;

Album album08 = new Album(300,500);
PImage LinkinParkCover;

Album album09 = new Album(580,500);
PImage U2Cover;

void setup() {
  size(800, 900);
  
  // Load album covers
  FreskuCover = loadImage("Fresku-cover.jpg");
  MacMillerCover = loadImage("MacMiller-cover.jpg");
  MaanCover = loadImage("Maan-cover.jpg");
  AmberRunCover = loadImage("AmberRun-cover.jpg");
  FisherCover = loadImage("Fisher-cover.jpg");
  NWACover = loadImage("NWA-cover.jpg");
  BMTHCover = loadImage("BMTH-cover.jpg");
  LinkinParkCover = loadImage("LinkinPark-cover.jpg");
  U2Cover = loadImage("U2-cover.jpg");
  
  // Set minin - beat plugin
  minim = new Minim(this);
  frameRate(30);
  smooth();
  
  // Load songs + create beatlistener for detection
  Fresku = minim.loadFile("Fresku-song.mp3", 2048);
  beatFresku = new BeatDetect(Fresku.bufferSize(), Fresku.sampleRate());
  bl = new BeatListener(beatFresku, Fresku);  
  
  MacMiller = minim.loadFile("MacMiller-song.mp3", 2048);
  beatMacMiller = new BeatDetect(MacMiller.bufferSize(), MacMiller.sampleRate());
  bl = new BeatListener(beatMacMiller, MacMiller);  
  
  Maan = minim.loadFile("Maan-song.mp3", 2048);
  beatMaan = new BeatDetect(Maan.bufferSize(), Maan.sampleRate());
  bl = new BeatListener(beatMaan, Maan);  
  
  AmberRun = minim.loadFile("AmberRun-song.mp3", 2048);
  beatAmberRun = new BeatDetect(AmberRun.bufferSize(), AmberRun.sampleRate());
  bl = new BeatListener(beatAmberRun, AmberRun);  
  
  Fisher = minim.loadFile("Fisher-song.mp3", 2048);
  beatFisher = new BeatDetect(Fisher.bufferSize(), Fisher.sampleRate());
  bl = new BeatListener(beatFisher, Fisher);
   
  NWA = minim.loadFile("NWA-song.mp3", 2048);
  beatNWA = new BeatDetect(NWA.bufferSize(), NWA.sampleRate());
  bl = new BeatListener(beatNWA, NWA);
  
  BMTH = minim.loadFile("BMTH-song.mp3", 2048);
  beatBMTH = new BeatDetect(BMTH.bufferSize(), BMTH.sampleRate());
  bl = new BeatListener(beatBMTH, BMTH);
  
  LinkinPark = minim.loadFile("LinkinPark-song.mp3", 2048);
  beatLinkinPark = new BeatDetect(LinkinPark.bufferSize(), LinkinPark.sampleRate());
  bl = new BeatListener(beatLinkinPark, LinkinPark);
  
  U2 = minim.loadFile("U2-song.mp3", 2048);
  beatU2 = new BeatDetect(U2.bufferSize(), U2.sampleRate());
  bl = new BeatListener(beatU2, U2);
}

void draw() {
  background(255);
  
  // Create album placeholders + put covers in place
  album01.create();
  image(FreskuCover,20,20);
  
  album02.create();
  image(MacMillerCover,300,20);
  
  album03.create();
  image(MaanCover, 580,20);
  
  album04.create();
  image(AmberRunCover, 20,260);
  
  album05.create();
  image(FisherCover, 300,260);
  
  album06.create();
  image(NWACover, 580,260);
  
  album07.create();
  image(BMTHCover,20,500);
  
  album08.create();
  image(LinkinParkCover,300,500);
  
  album09.create();
  image(U2Cover,580,500);
  
  // base functions
  mouseMovement();
  character();
  bottomBar();
          
  // Hover/location checks + functions to play music & shapes        
    if(characterX >= 20 && characterX <= 145) {
      if(characterY >= 20 && characterY <= 145) {
          instructions = "Press ENTER to visualise In Het Diepe";
          if (keyCode == ENTER) {
            Fresku.play();         
            background(255);
            
            if (beatFresku.isKick() == true){ randomTriangles(); }
            
            pictureFrame();
            instructions = "Now playing: Fresku - In Het Diepe";
            bottomBar();
          } 
      } 
      
      if(characterY >= 260 && characterY <= 385) {
        
          instructions = "Press ENTER to visualise Heaven";
          if (keyCode == ENTER) {
            AmberRun.play();
            background(255);
            
            for (int i = 0; i < AmberRun.bufferSize() - 1; i++) { randomLines(); }
            
            pictureFrame();
            instructions = "Now playing: Amber Run - Heaven";
            bottomBar();
          } 
      }
      
      if(characterY >= 500 && characterY <= 625) {
          instructions = "Press ENTER to visualise Happy Song";
          if (keyCode == ENTER) {
            BMTH.play();            
            background(255);
            
            if (beatBMTH.isKick() == true){ randomRectangles(); }
           
            pictureFrame();
            instructions = "Now playing: Bring Me The Horizon - Happy Song";
            bottomBar();
          } 
      }
    } 
    
    if(characterX >= 300 && characterX <= 425) {
      if(characterY >= 20 && characterY <= 145) {
          instructions = "Press ENTER to visualise Woods";
          if (keyCode == ENTER) {
              MacMiller.play();
              background(255);
              
              if (beatMacMiller.isKick() == true){ randomCircles();}
             
              pictureFrame();
              instructions = "Now playing: Mac Miller - Woods";
              bottomBar();
          } 
      }
      
      if(characterY >= 260 && characterY <= 385) {
           instructions = "Press ENTER to visualise Losing It";          
           if (keyCode == ENTER) {              
              Fisher.play();
              background(255);
              
              if (beatFisher.isKick() == true){ randomRectangles(); }
              if (beatFisher.isHat() == true){ randomCircles(); }
              if (beatFisher.isSnare() == true){ randomTriangles(); }
             
             
              pictureFrame();
              instructions = "Now playing: Fisher - Losing It";
              bottomBar();
            } 
      }    
      
      if(characterY >= 500 && characterY <= 625) {
          instructions = "Press ENTER to visualise One More Light";
          if (keyCode == ENTER) {
            LinkinPark.play();
            background(255);
            
            if (beatLinkinPark.isKick() == true){ randomSquares(); }
            
            pictureFrame();
            instructions = "Now playing: Linkin Park - One More Light";
            bottomBar();
          } 
      }
    } 
    
    if(characterX >= 580 && characterX <= 705) {
      if(characterY >= 20 && characterY <= 145) {
          instructions = "Press ENTER to visualise Onverstaanbaar";
          if (keyCode == ENTER) {
            Maan.play();
            background(255);
            
            if (beatMaan.isKick() == true){ randomRectangles(); }
            if (beatMaan.isHat() == true){ randomDots(); }
           
            pictureFrame();
            instructions = "Now playing: Maan - Onverstaanbaar";
            if (beatU2.isHat() == true){ randomDots(); }
            bottomBar();
          } 
      }
      
      if(characterY >= 260 && characterY <= 385) {
          instructions = "Press ENTER to visualise Straight Outta Compton";
          if (keyCode == ENTER) {
            NWA.play();
            background(255);
              
            if (beatNWA.isKick() == true){ randomCircles(); }
            if (beatNWA.isHat() == true){ randomTriangles(); }
            
            pictureFrame();
            instructions = "Now playing: NWA - Straight Outta Compton";
            bottomBar();
          } 
      }
      
      if(characterY >= 500 && characterY <= 625) {
          instructions = "Press ENTER to visualise No Line On The Horizon";
          if (keyCode == ENTER) {
            U2.play();
            background(255);
            
            if (beatU2.isKick() == true){ randomSquares(); }
            if (beatU2.isHat() == true){ randomDots(); }
           
            pictureFrame();
            instructions = "Now playing: U2 - No Line On The Horizon";
            bottomBar();
          } 
      }
    } 
}

void bottomBar() {
  fill(0, 255, 0);
  strokeWeight(3);
  stroke(0);
  rect(-10, 800, 820, 100);
  fill(0);
  textSize(22);
  text(instructions, 30, 860); 
}


void character() {
  fill(0, 255, 0, 150);
  rect(characterX, characterY, characterSize, characterSize);
}


void randomCircles() {
  fill(random(255), random(255), random(255));
  ellipse(random(800), random(700), random(800), random(700));
} 

void randomLines() {
  stroke(random(255), random(255), random(255));
  line(15, 15, random(800), random(800));
} 

void randomRectangles() {
  fill(random(255), random(255), random(255));
  rect(random(800), random(700), random(800), random(700));
}

void randomTriangles() {
  fill(random(255), random(255), random(255));
  triangle(random(700), random(800), random(700), random(700), random(800), random(700));
}

void randomDots() {
  stroke(random(255), random(255), random(255));
  point(random(255),random(255));
}

void randomSquares() {
  fill(random(255), random(255), random(255));
  square(random(800), random(700), random(800));
}

void pictureFrame() {
  fill(0);
  stroke(0);
  rect(0,0,45, 800); // left
  rect(0,0,800, 45); // top
  rect(755,0,800, 800); // right
  rect(0,755,800, 45); // bottom
  fill(white);
  text("Press any key to return", 46, 783); 
}


class Album { 
  int albumX, albumY;
  
  Album(int one, int two) {  
    albumX = one; 
    albumY = two;
  } 
  
  void create() {
    fill(0);
    rect(albumX, albumY, 200, 200);
  } 
} 


void keyPressed() {
  if (keyCode == leftKey) { characterX = characterX - speed; }
  if (keyCode == upKey) { characterY = characterY - speed; } 
  if (keyCode == rightKey) { characterX = characterX + speed; } 
  if (keyCode == downKey) { characterY = characterY + speed; } 
  
    Fresku.pause();
    Maan.pause();
    NWA.pause();
    U2.pause();
    LinkinPark.pause();
    AmberRun.pause();
    MacMiller.pause();
    Fisher.pause();
    BMTH.pause();
}

// https://www.processing.org/examples/mousefunctions.html
void mouseMovement() {
  if (mouseX > characterX-characterSize && mouseX < characterX+characterSize && 
      mouseY > characterY-characterSize && mouseY < characterY+characterSize) {
    overCharacter = true;  
  } else { overCharacter = false; }
}

void mousePressed() {
  if(overCharacter) { 
    locked = true; 
  } else { locked = false; }
  
  xOffset = mouseX-characterX; 
  yOffset = mouseY-characterY; 

}

void mouseDragged() {
  if(locked) {
    characterX = mouseX-xOffset; 
    characterY = mouseY-yOffset; 
  }
}

void mouseReleased() { locked = false; }

// http://code.compartmental.net/minim/beatdetect_method_iskick.html
class BeatListener implements AudioListener {
  private BeatDetect beat;
  private AudioPlayer source;

  BeatListener(BeatDetect beat, AudioPlayer source) {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }

  void samples(float[] samps) { beat.detect(source.mix); }
  void samples(float[] sampsL, float[] sampsR) { beat.detect(source.mix);}
}
