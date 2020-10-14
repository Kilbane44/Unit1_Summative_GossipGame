PImage gLeft;
PImage gRight;
ArrayList<Word> Words = new ArrayList<Word>();
int Screen =0;
String[] words;

String p1Word;
PVector p1Pos;
PVector p2Pos;
String p2Word;

int GameStartTime=0;

float p1GossCount=0;
void setup()
{
  size(1000, 800);
  gLeft = loadImage("GossipLeft.jpg");
  gLeft.resize(500, 400);
  gRight = loadImage("GossipRight.jpg");
  gRight.resize(500, 400);
  words = loadStrings("words.txt");
  p1Pos = new PVector(random(100, width/2), random(100, height-100));
  p2Pos = new PVector(random(width/2, width), random(100, height-100));
  p1Word = words[(int)random(words.length)];
  p2Word = words[(int)random(words.length)];
  textSize(50);
  textAlign(CENTER);
}

void draw()
{
  if (Screen == 0)
  {
    IntroScreen();
  }
  if (Screen == 1)
  {
    GameScreen();
  }
}




void GameScreen()
{
  background(0);
  image(gLeft, 0, 200);
  image(gRight, 500, 200);
  textSize(50);


  for (int i= Words.size()-1; i >=0; i--)
  {
    Words.get(i).Render();
    if (Words.get(i).kill)
    {
      Words.remove(i);
    }
  }

  fill(255, 255);
  text("GPS: ", 100, 100);
  text(p1GossCount/(((millis()-GameStartTime)/1000)+1)*1.0, 250, 100);
}


void IntroScreen()
{
  background(0);
  textSize(100);
  text("GIVE GOSS YAR", width/2, height/2);
  textSize(70);
  text("Press Space to start", width/2, height/2+100);
}

void keyPressed()
{
  //p1Pos = new PVector(random(100,width/2), random(100,height-100));
  //p2Pos = new PVector(random(width/2,width), random(100,height-100));
  //p1Word = words[(int)random(words.length)];
  //p2Word = words[(int)random(words.length)];

  if (Screen == 0)
  {
    Screen = 1;
    GameStartTime = millis();
  }
  if (Screen == 1)
  {
    Words.add(new Word(words[(int)random(words.length)], new PVector(random(100, width/2), random(100, height-100))));
    Words.add(new Word(words[(int)random(words.length)], new PVector(random(width/2, width), random(100, height-100))));
    p1GossCount+=1;
  }
}