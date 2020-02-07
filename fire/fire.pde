import peasy.*;
import damkjer.ocd.*;
PeasyCam cam;

ArrayList<Particle> fire = new ArrayList<Particle>(15000);
float acc = 0.3;
int radius = 5;
int floor = 600;
int scale = 20;

void setup()
{
  //fullScreen(P3D);
  size(800, 600, P3D);
  //grass = loadImage("grass.png");
  cam = new PeasyCam(this, 1200);
  frameRate(30);
  
  //grass.resize(200,200);
}

void draw()
{
  background(0);
  noFill();
  //noStroke();
  stroke(255);
  pushMatrix();
  translate(width/2, height/2);
  rotateX(PI/2);
  //rotateY(PI/3);
  //rotateZ(PI/3);
  translate(-400, -300);
  
  // draw the ground
  for(int y = 0; y < 100; y++)
  {
   beginShape();
   for(int x = 0; x< 100; x++)
   {
    //texture(grass);
    vertex(x*scale, y*scale); 
    vertex(x*scale, (y+1)*scale); 
    vertex((x+1)*scale, y*scale);
    vertex((x+1)*scale, (y+1)*scale);
   }
   
   endShape();
    
  }
  popMatrix();

  for(int i = 0; i < 20; i++)
  {
    Particle f = new Particle();
    fire.add(f);
  }
  
  
  //print(p.size());
  for(int i= 0; i<fire.size(); i++)
  {
     fire.get(i).update(0.3);
     fire.get(i).show();
     if(fire.get(i).isGone())
     {
       fire.remove(i);
     }
     
  }
}

class Particle{
  float posx;
  float posy;
  float posz;
  float vx;
  float vy;
  float vz;
  float green;
  // stands for transparency
  float trans;
  
  
  Particle(){
    posx = width/2 -200;
    posy = height/2 ;
    posz = 200;
    green = 50;
    trans = 255;
    vx = random(-3,3);
    vy = random(-7,-5);
    vz = random(-3,3);
    //vz = 0;
  }
  
  void update(float dt)
  {
    vy -= dt*acc;
    //posx = 5*sqrt(random());
    posx += dt*vx;
    posy += dt*vy;
    posz += dt*vz;
    green += 2;
    trans -= 3;
  }
  
  void show(){
    pushMatrix();
    fill(210, green, 30, trans);
    //lights();
    noStroke();
    translate(posx, posy, posz);
    box(5);
    //ellipse(0, 0, 10, 10);
    //sphere(5);
    popMatrix();
    
    //ellipse(posx, posy, 10, 10);
   }
   
   boolean isGone()
   {
     if(green > 210)
       return true;
     else
        return false;
   }
 
}
