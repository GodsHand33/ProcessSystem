class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  int speed;
  int frameCounter = 0;

  Animation(String imagePrefix, int count, int theSpeed)
  {
    imageCount = count;
    images = new PImage[imageCount];
    speed = theSpeed;

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 1) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {

    frameCounter++;
    if (frameCounter > speed)
    {
      frame = (frame+1) % imageCount;
      frameCounter = 0;
    }

    imageMode(CENTER);
    image(images[frame], xpos, ypos);
  }

  int getWidth() {
    return images[0].width;
  }
}

