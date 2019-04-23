
import KinectPV2.*;

KinectPV2 kinect;
PImage scratches;

PImage testdepthZero;
//BUFFER ARRAY TO CLEAN DE PIXLES
PImage depthToColorImg;
PImage bodyTrack;

//Distance Threashold
int maxD = 3000; //4500; // 4.5mx
int minD = 0;  //  50cm

void setup() {
  size(1920, 1080, P3D);

  kinect = new KinectPV2(this);
  kinect.enableDepthImg(true);
  kinect.enableColorImg(true);
  kinect.enablePointCloud(true);
  kinect.enableBodyTrackImg(true);
  kinect.init();

  depthToColorImg = createImage(1920, 1080, ARGB);//960, 540 // 512, 424
  testdepthZero = createImage(1920, 1080, ARGB); //960, 540
  for (int i = 0; i < testdepthZero.pixels.length; i++) {
    testdepthZero.pixels[i] = color(0, 0);
  }
  bodyTrack = createImage(KinectPV2.WIDTHDepth, KinectPV2.HEIGHTDepth, ARGB); //960, 540
  scratches = loadImage("ephemerals.jpg");
  scratches.resize(width, height);
}

void draw() {
  background(scratches); //(255);
  //Threshold of the point Cloud.
  kinect.setLowThresholdPC(minD);
  kinect.setHighThresholdPC(maxD);

  float [] mapDCT = kinect.getMapDepthToColor();

  //get the raw data from depth and color
  int [] colorRaw = kinect.getRawColor();
  PApplet.arrayCopy(kinect.getBodyTrackImage().pixels, bodyTrack.pixels);
  //clean de pixels
  PApplet.arrayCopy(testdepthZero.pixels, depthToColorImg.pixels);
  kinect.getColorImage();
  int count = 0;
  depthToColorImg.loadPixels(); 
  for (int i = 0; i < KinectPV2.WIDTHDepth; i++) {
    for (int j = 0; j < KinectPV2.HEIGHTDepth; j++) {
      color bt = bodyTrack.pixels[count];

      //incoming pixels 512 x 424 with position in 1920 x 1080
      float valX = mapDCT[count*2 + 0]; 
      float valY = mapDCT[count*2 + 1];

      //maps the pixels to 512 x 424, not necessary but looks better //960, 540
      int valXDepth = (int)((valX/1920.0)*512.0);//960.0); //512.0);
      int valYDepth = (int)((valY/1080.0)*424.0);//540.0); //424.0);


      int  valXColor = (int)(valX);
      int  valYColor = (int)(valY);
      if (brightness(bt) < 50) {
        if ( valXDepth > 0 && valXDepth < 512-1 && valYDepth > 0 && valYDepth < 424-1 &&
          valXColor > 0 && valXColor < 1920-1 && valYColor > 0 && valYColor < 1080-1) {

          // if ( valXDepth > 0 && valXDepth < 960-1 && valYDepth > 0 && valYDepth < 540-1 &&
          // valXColor > 0 && valXColor < 1920-1 && valYColor > 0 && valYColor < 1080-1) {
          color colorPixel = colorRaw[valYColor*1920 + valXColor];

          //depthToColorImg.pixels[valYDepth*960 + valXDepth] = colorPixel;
          depthToColorImg.pixels[valYColor*1920 + valXColor] = colorPixel;
          depthToColorImg.pixels[valYColor*1920 + valXColor -1] = colorPixel;
          depthToColorImg.pixels[valYColor*1920 + valXColor +1] = colorPixel;
          depthToColorImg.pixels[(valYColor-1)*1920 + valXColor] = colorPixel;
          depthToColorImg.pixels[(valYColor-1)*1920 + valXColor -1] = colorPixel;
          depthToColorImg.pixels[(valYColor-1)*1920 + valXColor +1] = colorPixel;
          depthToColorImg.pixels[(valYColor+1)*1920 + valXColor] = colorPixel;
          depthToColorImg.pixels[(valYColor+1)*1920 + valXColor -1] = colorPixel;
          depthToColorImg.pixels[(valYColor+1)*1920 + valXColor +1] = colorPixel;
        }
      }
      count++;
    }
  }
  bodyTrack.updatePixels();
  depthToColorImg.updatePixels();

  image(depthToColorImg, 0, 0 );

  text("fps: "+frameRate, 50, 50);
}
