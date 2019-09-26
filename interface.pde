import controlP5.*;
ControlP5 cp5;

boolean rPump1 = false;
//int temp1 = 0;
//int ph1 = 0;
//int biogas1 = 0;
//int rPump1_timer = 0;
//int fPump1_timer = 0;


void setup(){
  size(1000, 1000);
  cp5 = new ControlP5(this);
  
  cp5.addBackground("Digester1")
    .setSize(960,200)
    .setPosition(20,20)
    ;
  
  // Uncomment for static sliders
  cp5.addSlider("temp1")
   .setPosition(50, 80)
   .setSize(100,20)
   .setRange(0,100)
//   .setValue(temp1) // Change for reading from thermocouple
   .setLabel("Temperature (C)")
   .getCaptionLabel()
   .setPaddingX(5)
   .setFont(createFont("Arial", 12))
   .toUpperCase(false).setColor(0)
   ;
   cp5.getController("temp1").setBehavior(new ControlBehavior(){
     public void update(){ 
       setValue(random(50,60)); // Change for reading from thermocouple
     }
   }
   );

  cp5.addSlider("ph1")
   .setPosition(50, 110)
   .setSize(100,20)
   .setRange(0,14)
//   .setValue(ph1) // Change for reading from pH probe
   .setLabel("pH")
   .getCaptionLabel()
   .setPaddingX(5)
   .setFont(createFont("Arial", 12))
   .toUpperCase(false).setColor(0)
   ;
   cp5.getController("ph1").setBehavior(new ControlBehavior(){
     public void update(){ 
       setValue(random(0,14)); // Change for reading from thermocouple
     }
   }
   );
     
  cp5.addSlider("biogas1")
    .setPosition(50, 140)
    .setSize(100,20)
    .setRange(0,100)
//    .setValue(biogas1) // Change for reading from totalizer
    .setLabel("Cummulative biogas (mL)")
    .getCaptionLabel()
    .setPaddingX(5)
    .setFont(createFont("Arial", 12))
    .toUpperCase(false).setColor(0)
    ;
    cp5.getController("biogas1").setBehavior(new ControlBehavior(){
     public void update(){ 
       setValue(second()+40); // Change for reading from thermocouple
     }
   }
   );
     
   cp5.addToggle("toggle1")
     .setPosition(500,170)
     .setSize(50,20)
     .setValue(rPump1)
     .setMode(ControlP5.SWITCH)
     .setLabel("Recirculation pump")
     .getCaptionLabel()
     .setPaddingX(0)
     .setFont(createFont("Arial", 12))
     .toUpperCase(false)
     .setColor(0)
     ;
    
   cp5.addToggle("toggle2")
     .setPosition(800,170)
     .setSize(50,20)
     .setValue(rPump1)
     .setMode(ControlP5.SWITCH)
     .setLabel("Feed pump")
     .getCaptionLabel()
     .setPaddingX(0)
     .setFont(createFont("Arial", 12))
     .toUpperCase(false)
     .setColor(0)
     ;
     
     // Uncomment for static knobs/timers
   cp5.addKnob("rPump1")
   .setRange(0,60)
//   .setValue(rPump1_timer)
   .setPosition(500,40)
   .setRadius(50)
   ;
   cp5.getController("rPump1").setBehavior(new ControlBehavior(){
     public void update(){ 
       setValue(second()); // Change for reading from thermocouple
     }
   }
   );
    
   cp5.addKnob("fPump1")
   .setRange(0,60)
//   .setValue(fPump1_timer)
   .setPosition(800,40)
   .setRadius(50)
   ;
   cp5.getController("fPump1").setBehavior(new ControlBehavior(){
     public void update(){ 
       setValue(second()+30); // Change for reading from thermocouple
     }
   }
   );
}

void draw(){
  background(215);
  pushMatrix(); // Toggle uses it
  text("Digester 1", 50, 50);
  textSize(25);
  fill(0);
  popMatrix(); // Toggle uses it
//  addSliders();
 // addTimers();
}

// Enables dynamic sliders
//void addSliders(){
//   cp5.addSlider("temp1")
//   .setPosition(50, 70)
//   .setSize(100,20)
//   .setRange(0,100)
//   .setValue(temp1) // Change for reading from thermocouple
//   .setLabel("Temperature (C)")
//   .getCaptionLabel()
//   .setPaddingX(5)
//   .setFont(createFont("Arial", 12))
//   .toUpperCase(false).setColor(0)
//   ;
     
// cp5.addSlider("ph1")
//   .setPosition(50, 100)
//   .setSize(100,20)
//   .setRange(0,14)
//   .setValue(ph1) // Change for reading from pH probe
//   .setLabel("pH")
//   .getCaptionLabel()
//   .setPaddingX(5)
//   .setFont(createFont("Arial", 12))
//   .toUpperCase(false).setColor(0)
//   ;
     
// cp5.addSlider("biogas1")
//    .setPosition(50, 130)
//    .setSize(100,20)
//    .setRange(0,100)
//    .setValue(biogas1) // Change for reading from totalizer
//    .setLabel("Cummulative biogas (mL)")
//    .getCaptionLabel()
//    .setPaddingX(5)
//    .setFont(createFont("Arial", 12))
//    .toUpperCase(false).setColor(0)
//    ;
//}

void toggle1(boolean rPump1){
  if(rPump1 ==true){
    println("Recirculation pump ON"); // Do something if toggle is ON
  } else{
    println("Recirculation pump OFF"); // Do something if toggle is OFF
  }
}

void toggle2(boolean fPump1){
  if(fPump1 ==true){
    println("Feed pump ON"); // Do something if toggle is ON
  } else{
    println("Feed pump OFF"); // Do something if toggle is OFF
  }
}

//void addTimers(){
//  cp5.addKnob("rPump1")
//    .setRange(0,60)
//    .setValue(rPump1_timer)
//    .setPosition(500,40)
//    .setRadius(50)
//    ;
    
//  cp5.addKnob("fPump1")
//    .setRange(0,60)
//    .setValue(fPump1_timer)
//    .setPosition(800,40)
//    .setRadius(50)
//    ;
//}
