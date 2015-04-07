class Agent
{
  PVector position;
  PVector target;
  float orientationAngle;
  float speed;
  float length;
  Animation animation;

  Agent()
  {
    position = new PVector(random(0, width), random(0, height));
    target = new PVector();
    orientationAngle = random(0, TWO_PI);
    speed = 2f;
    length = 20f;
    animation = new Animation("butterfly", 2, 5);
  }

  void update()
  {
    straightMovement();
    noiseRotation();
    appearAtRandomWhenOutOfBound();
    renderAsLine();
  }

  void straightMovement()
  {
    position.add(new PVector(cos(orientationAngle - HALF_PI) * speed, sin(orientationAngle - HALF_PI) * speed));
  }

  void rotateToTarget()
  {
    orientationAngle = atan2(target.y - position.y, target.x - position.x) + HALF_PI;
  }

  void noiseRotation()
  {
    int noiseXRange = mouseX/10;
    int noiseYRange = mouseY/10;

    float noiseX = map(position.x, 0, width, 0, noiseXRange);
    float noiseY = map(position.y, 0, height, 0, noiseYRange);

    orientationAngle = TWO_PI * noise(noiseX, noiseY);
  }

  void appearAtOppositeWhenOutOfBound()
  {
    if (position.x < 0) position.x = width;
    if (position.x > width) position.x = 0;
    if (position.y < 0) position.y = height;
    if (position.y > height) position.y = 0;
  }

  void appearAtRandomWhenOutOfBound()
  {
    if ((position.x < 0) || (position.x > width) || (position.y < 0) || (position.y > height))
      position = new PVector(random(0, width), random(0, height));
  }

  void renderAsPoint()
  {
    rect(position.x, position.y, 10, 10);
  }

  void renderAsLine()
  {
    line(position.x - cos(orientationAngle - HALF_PI) * length, position.y - sin(orientationAngle - HALF_PI) * length, position.x + cos(orientationAngle - HALF_PI) * length, position.y + sin(orientationAngle - HALF_PI) * length);
  }

  void renderAsRect()
  {
    pushMatrix();
    translate(position.x, position.y);
    rotate(orientationAngle);
    rectMode(CENTER);
    fill(0);
    rect(0, 0, 1, 10);
    popMatrix();
  }

  void renderAsAnimation()
  {
    pushMatrix();
    translate(position.x, position.y);
    rotate(orientationAngle);
    animation.display(0, 0);
    popMatrix();
  }

  void clickToSetTarget()
  {
    if (mousePressed)
    {
      target = new PVector(mouseX, mouseY);
    }
  }

  void noiseAngle()
  {
    float noiseXRange = mouseX/100.0;
    float noiseYRange = mouseY/100.0;

    float noiseX = map(position.x, 0, width, 0, noiseXRange);
    float noiseY = map(position.y, 0, height, 0, noiseYRange);

    float noise = noise(noiseX, noiseY);
    orientationAngle = noise * TWO_PI;
  }
}

