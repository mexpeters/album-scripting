import ddf.minim.signals.*;//variois parts of the minim libary
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

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
BeatDetect beat;//linking beatdetect(BeatDetect class allows you to analyze an audio stream for beats) to the word beat
BeatListener bl;

float x = 60;
float y = 260;
float speed = 10;
float easing = 0.05;
String instructionsBase = "Move the cursor inside an album with the ARROW keys";
String instructions = instructionsBase;

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
  
  // Covers 
  FreskuCover = loadImage("Fresku-cover.jpg");
  MacMillerCover = loadImage("MacMiller-cover.jpg");
  MaanCover = loadImage("Maan-cover.jpg");
  AmberRunCover = loadImage("AmberRun-cover.jpg");
  FisherCover = loadImage("Fisher-cover.jpg");
  NWACover = loadImage("NWA-cover.jpg");
  BMTHCover = loadImage("BMTH-cover.jpg");
  LinkinParkCover = loadImage("LinkinPark-cover.jpg");
  U2Cover = loadImage("U2-cover.jpg");
  
  // Songs
  minim = new Minim(this);
  
  frameRate(30);
  smooth();
  
    Fresku = minim.loadFile("Fresku-song.mp3", 2048);
  fft = new FFT( Fresku.bufferSize(), Fresku.sampleRate() );
  
  MacMiller = minim.loadFile("MacMiller-song.mp3", 2048);
  fft = new FFT( MacMiller.bufferSize(), MacMiller.sampleRate() );
  
  Maan = minim.loadFile("Maan-song.mp3", 2048);
  
  AmberRun = minim.loadFile("AmberRun-song.mp3", 2048);
  beat = new BeatDetect(AmberRun.bufferSize(), AmberRun.sampleRate());//The internal buffer size of this sound object//
  bl = new BeatListener(beat, AmberRun);  
  
  Fisher = minim.loadFile("Fisher-song.mp3", 2048);
  beat = new BeatDetect(Fisher.bufferSize(), Fisher.sampleRate());//The internal buffer size of this sound object//
  bl = new BeatListener(beat, Fisher);
   
  NWA = minim.loadFile("NWA-song.mp3", 2048);
  beat = new BeatDetect(NWA.bufferSize(), NWA.sampleRate());//The internal buffer size of this sound object//
  bl = new BeatListener(beat, NWA);
  
  BMTH = minim.loadFile("BMTH-song.mp3", 2048);
  
  LinkinPark = minim.loadFile("LinkinPark-song.mp3", 2048);
  beat = new BeatDetect(LinkinPark.bufferSize(), LinkinPark.sampleRate());//The internal buffer size of this sound object//
  bl = new BeatListener(beat, LinkinPark);
  
  U2 = minim.loadFile("U2-song.mp3", 2048);
  
  beat.setSensitivity(0); 
  
}

void draw() {
  background(255);
  
  boolean kick = beat.isKick();//In frequency energy mode this returns true if a beat corresponding to the frequency range of a kick drum has been detected.
  boolean hat = beat.isHat();//In frequency energy mode this returns true if a beat corresponding to the frequency range of a hi hat has been detected.
  boolean snare = beat.isSnare();//In frequency energy mode this returns true if a beat corresponding to the frequency range of a snare has been detected.

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
  
  character();
  bottomBar();
          
    if(x >= 70 && x <= 170) {
      
      if(y >= 70 && y <= 170) {
          instructions = "Press ENTER to visualise In Het Diepe";
          if (keyCode == ENTER) {
            Fresku.play();
            beat.detect( Fresku.right );  
              if( beat.isOnset() ){
                // function
              }
          } 
      } 
      
      if(y >= 310 && y <= 410) {
        
          instructions = "Press ENTER to visualise Heaven";
          if (keyCode == ENTER) {
            background(0);
            instructions = "Now playing: Amber Run - Heaven";
            AmberRun.play();
            bottomBar();
            
            for (int i = 0; i < AmberRun.bufferSize() - 1; i++) {
                randomLines();
            }
          } 
      }
      
      if(y >= 550 && y <= 650) {
          instructions = "Press ENTER to visualise Happy Song";
          if (keyCode == ENTER) { BMTH.play(); } 
      }
    } 
    
    if(x >= 350 && x <= 450) {
      if(y >= 70 && y <= 170) {
          instructions = "Press ENTER to visualise Woods";
          if (keyCode == ENTER) { MacMiller.play(); } 
      }
      
      if(y >= 310 && y <= 410) {
           instructions = "Press ENTER to visualise Losing It";          
             if (keyCode == ENTER) {
              background(0);
              Fisher.play();
              
              if (hat == true){
                randomCircles();
              }
             
              instructions = "Now playing: Linkin Park - One More Light";
              bottomBar();
            } 
      }    
      
      if(y >= 550 && y <= 650) {
          instructions = "Press ENTER to visualise One More Light";
          if (keyCode == ENTER) {
            background(0);
            LinkinPark.play();
            
            if (kick == true){
              randomRectangles();
            }
           
            instructions = "Now playing: Linkin Park - One More Light";
            bottomBar();
          } 
      }
    } 
    
    if(x >= 630 && x <= 730) {
      if(y >= 70 && y <= 170) {
          instructions = "Press ENTER to visualise Onverstaanbaar";
          if (keyCode == ENTER) { Maan.play(); } 
      }
      
      if(y >= 310 && y <= 410) {
          instructions = "Press ENTER to visualise Straight Outta Compton";
          if (keyCode == ENTER) {
            //background(0);
            //NWA.play();
            
            //if (kick == true){
            //  randomRectangles();
            //}
           
            //instructions = "Now playing: N.W.A - Straight Outta Compton";
            //bottomBar();
          } 
      }
      
      if(y >= 550 && y <= 650) {
          instructions = "Press ENTER to visualise No Line On The Horizon";
          if (keyCode == ENTER) { U2.play(); } 
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
  fill(0, 255, 0);
  ellipse(x, y, 100, 100);
}


void randomCircles() {
  fill(random(255), random(255), random(255));
  ellipse(random(800), random(700), random(800), random(700));
  pictureFrame();
} 

void randomLines() {
  stroke(random(255), random(255), random(255));
  line(15, 15, random(800), random(800));
  pictureFrame();
} 

void randomRectangles() {
  fill(random(255), random(255), random(255));
  rect(random(800), random(700), random(800), random(700));
  pictureFrame();
}

void randomTriangle() {
  fill(random(255), random(255), random(255));
  triangle(random(700), random(800), random(700), random(700), random(800), random(700));
  pictureFrame();
}

void pictureFrame() {
  fill(0);
  stroke(0);
  rect(0,0,45, 800); // left
  rect(0,0,800, 45); // top
  rect(755,0,800, 800); // right
  rect(0,755,800, 45); // bottom
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
  if (keyCode == UP) { y = y - speed; }
  if (keyCode == DOWN) { y = y + speed; } 
  if (keyCode == LEFT) { x = x - speed; }
  if (keyCode == RIGHT) { x = x + speed; } 
}


class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;

  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }

  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }

  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}
