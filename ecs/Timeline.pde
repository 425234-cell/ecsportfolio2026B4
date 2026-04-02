//Hannah Hijjawi|26 Feb 2026|Timeline
void setup() {
  size(950,400);
}
void draw() {
  background(#A3C8FF);
  drawRef();
  histEvent(200,200,"Malala's Birth",true, "July 1997:\n Malala is Born in Mingora, Pakistan");
  histEvent(400,300,"First Speech",false, "Sept 2008:\n Malala Gives Her Very First Speech on the Taliban's Restriction of Women's Rights to Education");
  histEvent(500,200,"Assination Attempt",true,"Oct 2012:\n Malala is Shot by Taliban Gunman on her School Bus and She Survives the Bullet");
  histEvent(570,300,"Memoir Published",false,"Oct 2013:\n Malala Publishes her memoir, 'I Am Malala.'");
  histEvent(640,200,"Nobel Peace Prize",true,"Oct 2014:\n Malala Becomes the Youngest Person to Win the Nobel Peace Prize at 17 Years of Age");
  histEvent(710,300,"All-Girls School",false,"July 2015:\n The Malala Fund Opens 'Malala Yousafzai All-Girls School'");
  histEvent(810,200,"Attending Oxford",true,"2017:\n Malala Begins Attending Oxford University");
  histEvent(850,300,"Graduation",false,"June 2020:\n Malala Graduates from Oxford University");
}
void drawRef() {
  textAlign(CENTER);
  textSize(35);
  fill(#FFFFFF);
  text("Malala Yousafzai: Timeline",width/2,60);
  textSize(20);
  text("By Hannah Hijjawi",width/2,80);
  strokeWeight(2);
  line(50,250,900,250);//Timeline
  line(50,245,50,255);//Left Tick
  line(900,245,900,255);//Right Tick
  line(450,245,450,255);//Middle Tick
  textSize(15);
  text("1990",50,270);//First Date
  text("2010",450,270);//Mid Date
  text("2030",900,270);//Last Date
}
void histEvent(int x, int y, String title, boolean top, String detail) {
  if(top == true) {
    line(x,y,x-15,y+50);
  } else {
    line(x,y,x-15,y-50);
  }
  rectMode(CENTER);
  fill(#E0CE93);
  rect(x,y,130,30,5);
  fill(#FFFFFF);
  text(title,x,y+5);
  if(mouseX > x-50 && mouseX < x+50 && mouseY > y-15 && mouseY < y+15) {
    text(detail,width/2,350);
  }
}
