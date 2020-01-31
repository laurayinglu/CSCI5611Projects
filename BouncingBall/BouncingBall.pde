
String projectTitle = "Bouncing Ball";

// velocity of ball x, y, z

float [] vx = {1,2,3};
float [] vy = {3,6,9};
float [] vz = {0,0,0};
float radius = 20; 
float floor = 600;
float wall = 600;
float acceleration = 0.8;

float [] posx = {10,100,200};
float [] posy = {10,20,30};
float [] posz = {0,0,0};

//Creates a 600x600 window for 3D graphics 
void setup() {
 size(600, 600, P3D);
 noStroke();
}

void motion(float dt){ 
  vy[0] = vy[0] + acceleration * dt;  
  posy[0] = posy[0]+vy[0]*dt;
  
  vx[0] = vx[0] + acceleration * dt;  
  posx[0] = posx[0]+vx[0]*dt;
  
  vy[1] = vy[1] + acceleration * dt;  
  posy[1] = posy[1]+vy[1]*dt;
  
  vx[1] = vx[1] + acceleration * dt;  
  posx[1] = posx[1]+vx[1]*dt;
  
  vy[2] = vy[2] + acceleration * dt;  
  posy[2] = posy[2]+vy[2]*dt;
  
  vx[2] = vx[2] + acceleration * dt;  
  posx[2] = posx[2]+vx[2]*dt;
  
  // if the ball hit the ground
  if (posy[0] + radius > floor)
  {
    posy[0] = floor - radius; 
    vy[0] *= -.96; 
  }
  
  if(posx[0] + radius > wall)
  {
     posx[0] = wall - radius;
     vx[0] *= -0.95;
  }
  
  if(posx[0] < 0)
  {
     posx[0] = radius;
     vx[0] *= -.94;
  }
  
  if(posy[0] <= radius)
  {
     posy[0] = radius;
     vy[0] *= -.9;
  }

  
  // second ball
  
   if (posy[1]  + radius > floor)
  {
    posy[1] = floor - radius; 
    vy[1] *= -0.91; 
  }
  
  if(posx[1] + radius > wall)
  {
     posx[1] = wall - radius;
     vx[1] *= -0.90;
  } 
  
  if(posx[1]  < 0)
  {
     posx[1] = radius;
     vx[1] *= -0.86;
  }
  
  if (posy[2] + radius > floor)
  {
    posy[2] = floor - radius; 
    vy[2] *= -.84; 
  }
  
  if(posx[2] + radius > wall)
  {
     posx[2] = wall - radius;
     vx[2] *= -0.8;
  }
  
  if(posx[2] < 0)
  {
     posx[2] = radius;
     vx[2] *= -0.7;
  }
  
  // if balls collide together
  //if(posx[0]-posx[1] <= radius || posx[1]-posx[0] <= radius){
  //  vx[0] *= -1;
  //  vx[1] *= -1;

  //}
   
}


void drawBalls()
{  
  pushMatrix();
  // ball 1
  fill(171, 237, 180);
  noStroke();
  lights();
  translate(posx[0], posy[0]);
  specular(255,255,255);shininess(10);noStroke();sphereDetail(400);
  sphere(radius);
  popMatrix();
  
   //ball 2
  pushMatrix();
  fill(11, 40, 156);
  lights();
  translate(posx[1], posy[1]);
  specular(255,255,255);shininess(10);noStroke();sphereDetail(400);
  sphere(radius);
  popMatrix();
  
  //ball 3
  pushMatrix();
  fill(247, 245, 96);
  translate(posx[2], posy[2]);
  specular(255,255,255);shininess(10);noStroke();sphereDetail(400);
  sphere(radius);
  popMatrix();
}

void draw() {
  float startFrame = millis();
  background(0);
  lights();
  //drawBox();
  motion(1.5); 
  float endPhysics = millis();
  drawBalls();
  float endFrame = millis();
  String runtimeReport = "Frame: "+str(endFrame-startFrame)+"ms,"+
        " Physics: "+ str(endPhysics-startFrame)+"ms,"+
        " FPS: "+ str(round(frameRate)) +"\n";
  surface.setTitle(projectTitle+ "  -  " +runtimeReport);
}
