void setup() {
  size(400, 400);
  sayMyName();
  sayMyName();
  sayMyName();
  sayMyName();
}

void sayMyName() {
  float textX = random(0, 200);
  float textY = random(0, 300);
  String myName = "Алекс";

  fill(255, 0, 0);
  textSize(30);
  text("Привет, " + myName, textX, textY);
}