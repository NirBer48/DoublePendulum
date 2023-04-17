float r1 = 200;
float r2 = 200;
float m1 = 40;
float m2 = 10;
float a1 = PI/2;
float a2 = PI/2;
float a1_v = 0;
float a2_v = 0;
float point = 40; 
float g = 1;
float px2 = -1;
float py2 = -1;

////////////////////////
float Br1 = 200;
float Br2 = 200;
float Bm1 = 40;
float Bm2 = 10;
float Ba1 = PI/2;
float Ba2 = PI/2-0.1;
float Ba1_v = 0;
float Ba2_v = 0;
float Bpoint = 40; 
float Bg = 1;
float Bpx2 = -1;
float Bpy2 = -1;
///////////////////////////

PGraphics canvas;

void setup(){
    size(1200,1000);
    canvas = createGraphics(1200, 1000);
    canvas.beginDraw();
    canvas.background(255);
    canvas.endDraw();
}
void draw() {
    float num1 = -g*(2*m1+m2)*sin(a1);
    float num2 = -m2*g*sin(a1-2*a2);
    float num3 = -2*sin(a1-a2)*m2;
    float num4 = a2_v*a2_v*r2+a1_v*a1_v*r1*cos(a1-a2);
    float den = r1*(2*m1+m2-m2*cos(2*a1-2*a2));
    float a1_a = (num1 + num2 + num3*num4)/den;
    
    /////////////////////////////
    float Bnum1 = -Bg*(2*Bm1+Bm2)*sin(Ba1);
    float Bnum2 = -Bm2*Bg*sin(Ba1-2*Ba2);
    float Bnum3 = -2*sin(Ba1-Ba2)*Bm2;
    float Bnum4 = Ba2_v*Ba2_v*Br2+Ba1_v*Ba1_v*r1*cos(Ba1-Ba2);
    float Bden = Br1*(2*Bm1+Bm2-Bm2*cos(2*Ba1-2*Ba2));
    float Ba1_a = (Bnum1 + Bnum2 + Bnum3*Bnum4)/Bden;
    ///////////////////////
    
    num1 = 2*sin(a1-a2);
    num2 = a1_v*a1_v*r1*(m1+m2);
    num3 = g*(m1+m2)*cos(a1);
    num4 = a2_v*a2_v*r2*m2*cos(a1-a2);
    den = r2*(2*m1+m2-m2*cos(2*a1-2*a2));
    float a2_a = (num1 * (num2 +num3 +num4))/den;
    
    ////////////////////////////
    Bnum1 = 2*sin(Ba1-Ba2);
    Bnum2 = Ba1_v*Ba1_v*Br1*(Bm1+Bm2);
    Bnum3 = Bg*(Bm1+Bm2)*cos(Ba1);
    Bnum4 = Ba2_v*Ba2_v*Br2*Bm2*cos(Ba1-Ba2);
    Bden = Br2*(2*Bm1+Bm2-Bm2*cos(2*Ba1-2*Ba2));
    float Ba2_a = (Bnum1 * (Bnum2 +Bnum3 +Bnum4))/Bden;
    ///////////////////////////
    
    //background(255);
    image(canvas,0,0);
    stroke(0);
    strokeWeight(2);
    
    translate(600, 450);
    
    float x1 = r1 * sin(a1);
    float y1 = r1 * cos(a1);
    float x2 = x1 + r2 * sin(a2);
    float y2 = y1 + r2 * cos(a2);
    
    //////////////////////////////
    float Bx1 = Br1 * sin(Ba1);
    float By1 = Br1 * cos(Ba1);
    float Bx2 = Bx1 + r2 * sin(Ba2);
    float By2 = By1 + r2 * cos(Ba2);
    ///////////////////////////////
    
    line(0,0,x1,y1);
    fill(0);
    ellipse(x1,y1,point,point);
    
    ///////////////////
    stroke(255, 0, 0);
    line(0,0,Bx1,By1);
    fill(255, 0, 0);
    ellipse(Bx1,By1,Bpoint,Bpoint);
    ////////////////////
    
    stroke(0);
    line(x1,y1,x2,y2);
    fill(0);
    ellipse(x2,y2,point,point);
    
    ////////////////////
    stroke(255, 0, 0);
    line(Bx1,By1,Bx2,By2);
    fill(255, 0, 0);
    ellipse(Bx2,By2,Bpoint,Bpoint);
    ////////////////////
    
    a1_v += a1_a;
    a2_v += a2_a;
    a1 += a1_v;
    a2 += a2_v;
    
    /////////////////////////
    Ba1_v += Ba1_a;
    Ba2_v += Ba2_a;
    Ba1 += Ba1_v;
    Ba2 += Ba2_v;
    ////////////////////////
    
    
    canvas.beginDraw();
    canvas.translate(600,450);
    canvas.strokeWeight(1);
    if (frameCount>1){   
      canvas.stroke(0);
      canvas.line(px2,py2,x2,y2);
    }
    //////////////
    if (frameCount>1){  
      canvas.stroke(255, 0, 0);
      canvas.line(Bpx2,Bpy2,Bx2,By2);
    }
    //////////////
    canvas.endDraw();
    px2 = x2;
    py2 = y2;
    
    ///////
    Bpx2 = Bx2;
    Bpy2 = By2;
    ///////
}
