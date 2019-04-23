/**
 * talleres CCE mariana carranza
 * Example 01: imagen-01
 * by mariana carranza.   
 */

PImage img, newimg;
int numberPixels;

 /* @pjs preload ="fridaKahlo.jpg"; */ 
  
void setup() {
  size (557, 396);
  smooth();
  img = loadImage ("fridaKahlo.jpg"); 
  numberPixels = img.width * img.height;
  newimg = createImage(img.width, img.height, RGB);
}
  
void draw()
{  
  
  img.loadPixels();
   for ( int i = 0; i < numberPixels; i++) {
    // access the  of each pixel - from 0 to 255
    color myPixel =  img.pixels[i];
    float brigthVal = brightness (myPixel);

    // if brightness more than 200: red pixel
    if ( brigthVal > 200) {
      newimg.pixels[i] = color (255, 0, 0);
    }
    // if brightness less than 200: green pixel
    else {
      newimg.pixels[i] = color (0, 255, 0);
    }
  }
  // draw the transformed pixels
  newimg.updatePixels();
 // draw the modified image on the screen
  image(newimg, 0, 0);
}
