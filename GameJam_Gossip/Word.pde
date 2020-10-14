class Word
{
  String word;
  PVector pos;
  
  int spawnTime;
  float alpha;
  boolean kill;
  Word()
  {
  }
  
  Word(String _word, PVector _pos)
  {
    word = _word;
    pos = _pos;
    spawnTime = millis();
    kill=false;
    alpha = 255;
  }
  void Render()
  {
    fill(255,0,255,alpha);
    text(word,pos.x,pos.y);
    alpha-= 5;
    
    if(alpha < 10)
    {
      kill = true;
    }
  }
  
  
}