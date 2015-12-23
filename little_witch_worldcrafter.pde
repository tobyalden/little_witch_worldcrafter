final int GAME_HEIGHT = 400;

PImage img_bg;
PImage img_lines;
PImage img_trippy;
PImage img_collage;
PImage img_angel;
PImage img_rays;

PImage tool_bg;
PImage tool_lines;
PImage tool_trippy;
PImage tool_collage;
PImage tool_rays;

float FOG_SPEED = 0.2;
float BOB_AMOUNT = 10.0;
float fogScroller;
float rayScroller;
float fogBobber;

void setup() {
  size(500, 600);
  frameRate(60);
  noCursor();
  img_bg = loadImage("background.png");
  img_lines = loadImage("lines.png");
  img_trippy = loadImage("trippy.png");
  img_collage = loadImage("collage.png");
  img_angel = loadImage("angel.png");
  img_rays = loadImage("rays.png");
  fogScroller = 0;
  fogBobber = 0;
  tool_bg = loadImage("tool_bg.png");
  tool_lines = loadImage("tool_lines.png");
  tool_trippy = loadImage("tool_trippy.png");
  tool_collage = loadImage("tool_collage.png");
  tool_rays = loadImage("tool_rays.png");
}

void draw() {
  fogScroller += FOG_SPEED;
  rayScroller += FOG_SPEED*2;
  fogBobber += 0.01;
  if(fogScroller > width) {
    fogScroller -= width;
  } 
  if(rayScroller > width) {
    rayScroller -= width;
  }
  
  image(img_bg, 0, 0);
  image(img_lines, 0, 0);
  image(img_trippy, fogScroller, 0);
  image(img_trippy, fogScroller-width, 0);
  image(img_collage, 0, 0);
  image(img_rays, -fogScroller, -200);
  image(img_rays, -fogScroller+width, -200);
  
  image(tool_bg, 0, GAME_HEIGHT);
  image(tool_lines, 100, GAME_HEIGHT);
  image(tool_trippy, 200, GAME_HEIGHT);
  image(tool_collage, 300, GAME_HEIGHT);
  image(tool_rays, 400, GAME_HEIGHT);
  
  image(img_angel, mouseX-50, mouseY + sin(fogBobber*4)*10-25);

  textSize(32);
  text("500*400", 10, 30);
}

void mouseClicked() {
  if(overRect(0, GAME_HEIGHT, 100, 100)) {
     println("BG Tool"); 
     selectInput("Select a background:", "bgSelected");
  }
  else if(overRect(100, GAME_HEIGHT, 100, 100)) {
     println("Lines Tool"); 
     selectInput("Select some lines:", "linesSelected");
  }
  else if(overRect(200, GAME_HEIGHT, 100, 100)) {
     println("Trippy Tool"); 
     selectInput("Select something trippy:", "trippySelected");
  }
  else if(overRect(300, GAME_HEIGHT, 100, 100)) {
     println("Collage Tool"); 
     selectInput("Select some lines:", "collageSelected");
  }
  else if(overRect(400, GAME_HEIGHT, 100, 100)) {
     println("Rays Tool"); 
     selectInput("Select some lines:", "raysSelected");
  }
}

void bgSelected(File selection) {
  if (selection == null) {
    println("Window was closed or you hit cancel.");
  } else {
    println("You selected " + selection.getAbsolutePath());
    img_bg = loadImage(selection.getAbsolutePath());
  }
}

void linesSelected(File selection) {
  if (selection == null) {
    println("Window was closed or you hit cancel.");
  } else {
    println("You selected " + selection.getAbsolutePath());
    img_lines = loadImage(selection.getAbsolutePath());
  }
}

void trippySelected(File selection) {
  if (selection == null) {
    println("Window was closed or you hit cancel.");
  } else {
    println("You selected " + selection.getAbsolutePath());
    img_trippy = loadImage(selection.getAbsolutePath());
  }
}

void collageSelected(File selection) {
  if (selection == null) {
    println("Window was closed or you hit cancel.");
  } else {
    println("You selected " + selection.getAbsolutePath());
    img_collage = loadImage(selection.getAbsolutePath());
  }
}

void raysSelected(File selection) {
  if (selection == null) {
    println("Window was closed or you hit cancel.");
  } else {
    println("You selected " + selection.getAbsolutePath());
    img_rays = loadImage(selection.getAbsolutePath());
  }
}



boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}