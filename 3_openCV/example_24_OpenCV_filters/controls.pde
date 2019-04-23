import controlP5.*;

float contrast;
int bright, threshold, blur, flip;

ControlP5 cp5;

void initControls() {

  cp5 = new ControlP5(this);

  cp5.addSlider("contrast")
    .setRange(0, 15)
    .setValue(6)
    .setPosition(100, 500)
    .setSize(10, 100)
    ;

  cp5.addSlider("bright")
    .setRange(-255, 255)
    .setValue(150)
    .setPosition(150, 500)
    .setSize(10, 100)
    ;

  cp5.addSlider("threshold")
    .setRange(0, 255)
    .setValue(60)
    .setPosition(200, 500)
    .setSize(10, 100)
    ;

  cp5.addSlider("blur")
    .setRange(1, 20)
    .setValue(4)
    .setPosition(250, 500)
    .setSize(10, 100)
    .setNumberOfTickMarks(10)
    ;

  cp5.addSlider("flip")
    .setRange(0, 1)
    .setValue(1)
    .setPosition(300, 500)
    .setSize(10, 100)
    .setNumberOfTickMarks(2)
    ;
}
