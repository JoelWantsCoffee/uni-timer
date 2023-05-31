PImage img;
PImage img2;
PFont fnt;

void form(PImage img) {
  img.loadPixels();
   for (int i = 0; i < img.width * img.height; i++) {
     //println("C: " + img.pixels[i] + "," + color(255, 0, 0));
      if (img.pixels[i] == color(0, 255, 0)) {
         img.pixels[i] = color(255, 255, 255, 0); 
      } else if (img.pixels[i] == color(0, 0, 255)) {
         img.pixels[i] = color(255, 255, 255);
      }
   }
   img.updatePixels();  
}

void setup() {
  //background(255);
  fnt = createFont("comic.ttf", 16);
   img = loadImage("ubeaut.png");
   img2 = loadImage("ubeaut2.png");
   println("" + img.width + "," + img.height);
   //size(786, 419);
   fullScreen();
   form(img);
   form(img2);
}

void draw() {
  scale(2.6);
  background(255);
  fill(0);
  textFont(fnt);
  textSize(72);
  textAlign(TOP, LEFT);
  int remain = (50 - minute());
  int t = hour() % 12;
  
  if (t == 0) {
    t = 12;
  }
  if (remain > 0) {
  image(img, 0, 0); 
  } else {
    image(img2, 0, 0); 
  }
  text("" + t + ":" + nf(minute(),2), 357, 258);
  textSize(20);
  if (remain > 0) {
    fill(0);
    text("\n" + remain + " minutes of study remain", 347, 258);
  } else {
    fill(random(0,255), random(0,255), random(0,255));
    text("\n" + (10 + remain) + " minutes of break remain", 347, 258);
  }
  
  //367, 218
}
