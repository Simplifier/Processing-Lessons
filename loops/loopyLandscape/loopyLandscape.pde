size(400, 400);
background(144, 240, 234);

// рисуем солнце
noStroke();
fill(255, 140, 0);
ellipse(335, 66, 70, 70);

PImage grass = loadImage("GrassBlock.png");
PImage tree = loadImage("TreeUgly.png");

// рисуем дерево и траву
image(grass, 0, 270);
image(tree, 0, 200);