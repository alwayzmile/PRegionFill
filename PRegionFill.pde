// PRegionFill.pde
// global variable declarations, importing needed java library,
// and basic structure of processing program which has setup and draw procedures 
// todo: there is still bug in checkered pattern fill

import javax.swing.JOptionPane;
import java.awt.FileDialog;
import java.util.Stack;
import java.util.concurrent.TimeoutException;

/////////////////////////////////////////////////
// CANVAS & ...
/////////////////////////////////////////////////
PGraphics pg,   // canvas first layer (most behind)
          tmp,  // canvas second layer (front)
          unredoTmp;  // temporary canvas layer for undo and redo feature
int x01, x02, y01, y02, 
    Rx, Ry,  // ellipse center_width, ellipse center_height
    lineSize = 1;  // default line size
color selectedColor = color(0); // default selected color is black
Point tmpP;
boolean ribbonOn = true,          // true if the ribbon area is clickable
        canvasOn = true,          // true if the canvas is drawable
        optSizeOn = false,        // true if the stroke size list appears
        optFillOn = false,        // true if the fill method list appears
        isDoneSaving = false,     // true if saving have just done
        ctrlPressed = false;      // true if Ctrl key is pressed
String tool = "line";
String fillOptions[] = { "Flood fill recursive",
                         "Flood fill with stack",
                         "Flood fill scanline px to px",
                         "Flood fill scanline (stack)",
                         "Boundary fill recursive",
                         "Boundary fill with stack",
                         "Boundary fill scanline px to px",
                         "Boundary fill scanline (stack)",
                         "Fill horizontal striped pattern",
                         "Fill vertical striped pattern",
                         "Fill with checkered pattern" };
ArrayList<PGraphics> undo = new ArrayList<PGraphics>();
ArrayList<PGraphics> redo = new ArrayList<PGraphics>();

/////////////////////////////////////////////////
// FILL
/////////////////////////////////////////////////
int fillOptionIndex = 0, 
    fillingEndMs, fillingStartMs;
boolean showFillingOrder = false,   // true if show filling order option is checked
        waitSelectBoundary = false; // true if the program is waiting for the user to select the boundary color
color boundaryColor = color(0); // default boundary color is black
ArrayList<Point> pointsFillingStep = new ArrayList<Point>();
Fill fill;

/////////////////////////////////////////////////
// STYLE
/////////////////////////////////////////////////
PImage img;  // for icon in the application
PFont font;  // for text in the application

// run first, only once
void setup() {
  smooth();
  frame.setTitle( "PRegionFill : Region Fill Implementation" );
  frameRate( 1000 );
  size( 800, 500 );
  
  // Font used in the application
  font = loadFont( "Calibri-Light-13.vlw" );
  textFont( font );  
  
  // create application icon
  img = loadImage( "sinter.png" );
  PGraphics icon = createGraphics(256, 256);
  icon.beginDraw();
  icon.image(img, 0, 0, 256, 256);
  icon.endDraw();
  frame.setIconImage(icon.image);
  
  tmp = createGraphics( 800, 410 );
  tmp.beginDraw();
  tmp.noSmooth();
  tmp.background(255, 0);
  
  // create canvas
  pg = createGraphics( 800, 410 );
  pg.beginDraw();
  pg.noSmooth();
  restoreDrawing();
  
  undo.add( createGraphics(pg.width, pg.height) );
  undo.get(0).background( 255, 0 );
}

// infinite loop
void draw() {
  pg.endDraw();        // keep end drawing in canvas to respond to the new drawing drawn by user
  image( pg, 0, 71 );  // keep generating drawing in canvas
  pg.beginDraw();
 
  if ( pointsFillingStep.size() > 0 ) {
    tmpP = pointsFillingStep.remove(0);
    tmp.strokeWeight( 1 );
    tmp.stroke( selectedColor );
    tmp.point( tmpP.x, tmpP.y );
//    tmp.noStroke();
//    tmp.fill( selectedColor );
//    tmp.rect( tmpP.x, tmpP.y, 1, 1 );
    //print( "(" + tmpP.x + "," + tmpP.y + ") " );
    restoreDrawing();
    //print( pointsFillingStep.size() + " " );
  }
  
  statusBar();  // always show the status bar
  showRibbon(); // always show the ribbon
}
