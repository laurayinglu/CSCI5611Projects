import peasy.*;
import damkjer.ocd.*;
PeasyCam cam;

ArrayList<Drops> p = new ArrayList<Drops>();
float acc = 0.3;
int radius = 5;
int floor = 250;
int scale = 40;
PImage grass;

void setup()
{
  size(700, 700, P3D);
  frameRate(30);
  grass = loadImage("grass.png");
  cam = new PeasyCam(this, 1200);
  grass.resize(200, 200);
}

void draw()
{
  background(255);
 
  for(int i = 0; i< 50; i++){
    Drops drop = new Drops(100, 50);
    p.add(drop);
  }
  
  //print(p.size());
  for(int i= 0; i<p.size(); i++)
  {
     p.get(i).update(0.4);
     p.get(i).show();
     
     if(p.get(i).out())
     {
       p.get(i).trans = 0;
       p.remove(i);
     }
  }
  
}

class Drops{
  float posx;
  float posy;
  float posz;
  float vx;
  float vy;
  float vz;
  float green;
  float trans;
  float time;
  
  Drops(float posX, float posY){
    posx = posX;
    posy = posY;
    posz = 0;
    //green = 0;
    trans = 65;
    time = 0;
    vx = random(-3,3);
    vy = random(-10,-9);
    vz = random(-3,3);
  }
  
  void update(float dt)
  {
    vy += dt*acc;
    posx += dt*vx;
    posy += dt*vy;
    posz += dt*vz;
    //green += 5;
    //trans -= 1;
    // if hit the ground
    
    if (posy + radius >= floor)
    {
      posy = floor - radius; 
      vy *= -.5; 
      trans += 20;
    }
  
  }
  
  void show(){ 
    pushMatrix();
    translate(100, 100, 0);
    noStroke();lights();
    fill(236, 247, 60);
    box(100);
    popMatrix();
    
    
    pushMatrix();
    fill(0, 10, 255, trans);
    noStroke();
    //lights();
    translate(posx, posy, posz);
    //ellipse(0, 0, 10, 10);
    //sphere(5);
    box(3);
    popMatrix();
   
    }
    
    boolean out()
    {
       return (posx >= 500 || posx <= -300);
    }

}
