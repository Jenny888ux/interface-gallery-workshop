


PImage img, blImg;
int numpix, bl;
String ker, num;

float [][] kernel;

// odd side square matrices

float[][] kernel1 = { 
  {
    1, 1, 1
  }
  , 
  {
    1, 1, 1
  }
  , 
  {
    1, 1, 1
  }
};


float[][] kernel2 = { 
  {
    1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1
  }
  , 
}; 


float[][] kernel3 = { 
  {
    1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1
  }
  , 
};  

float[][] kernel4 = { 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
};   

float[][] kernel5 = { 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
}; 


float[][] kernel6 = { 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
}; 



void setup() {
  size(640, 480, P2D);
  smooth();
  noLoop();

  img = loadImage("rio.jpg"); // Load the original image
  blImg = createImage(img.width, img.height, RGB);
  numpix = img.width*(img.height);

  // variabel to change the blur
  ker = "kernel";
  img.loadPixels();

  // variabel to choice kernel size
  bl = 2;
}
void draw() {
  // matrices size
  float d = sq(2*bl+1);

  if (bl ==1) {
    kernel = kernel1;
  }
  if (bl ==2) {
    kernel = kernel2;
  }
  if (bl ==3) {
    kernel = kernel3;
  }
  if (bl ==4) {
    kernel = kernel4;
  }
  if (bl ==5) {
    kernel = kernel5;
  }
  if (bl ==6) {
    kernel = kernel6;
  }

  // Loop through every pixel in the image.
  for (int y = bl; y < img.height - bl; y++) { // Skip top and bottom edges
    for (int x = bl; x < img.width - bl; x++) { // Skip left and right edges

      float sumr = 0; // Kernel sum for this pixel
      float sumg = 0;
      float sumb = 0;

      for (int ky = -bl; ky <= bl; ky++) {
        for (int kx = -bl; kx <= bl; kx++) {

          // Calculate the adjacent pixel for this kernel point
          int pos = (y + ky) * img.width + (x + kx);

          // Image is grayscale, red/green/blue are identical
          float valr = red(img.pixels[pos]);
          float valg = green(img.pixels[pos]);
          float valb = blue(img.pixels[pos]);

          // Multiply adjacent pixels based on the kernel values
          sumr += kernel[ky+bl][kx+bl] * valr/d;
          sumg += kernel[ky+bl][kx+bl] * valg/d;
          sumb += kernel[ky+bl][kx+bl] * valb/d;
        }
      }

      blImg.pixels[y*img.width + x] = color(sumr, sumg, sumb);
    }
  }
  // State that there are changes to blurImg.pixels[]

  blImg.updatePixels();

  // Draw the original image
  image(img, 0, 0);
  // Draw the new image
  image(blImg, img.width, 0);

  //blur control
  println(bl);
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      bl++;
      if (bl > 6) {
        bl = 6;
      }
      redraw();
    }
    if (keyCode == DOWN) {
      bl--;
      if (bl < 1) {
        bl = 1;
      }
      redraw();
    }
  }
}
