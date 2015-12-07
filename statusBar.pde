// statusBar.pde
// Status bar area from (0, 480)-(800, 500)

void statusBar() {
  fill( #D1D1D1 );
  noStroke();
  rect( 0, 483, 800, 17 );
  
  strokeWeight( 2 );
  stroke( #B2B4B4 );
  line( 0, 481, 800, 481 );  // Separator between canvas and status bar
  
  // Show mouseX and mouseY position in canvas area
  fill( 20 );
  stroke( 1 );
  if ( mouseY > 70 && mouseY <= 480 && canvasOn )
    text( "(x,y): " + mouseX + "," + (mouseY-71), 5, 494 );
  
  if ( isDoneSaving )
    text( "Done saving dots/lines", 100, 494 );  
  else if ( canvasOn ) {
    fill( 50 );
    if ( mouseY > 70 && mouseY <= 480 && pointsFillingStep.size() > 0 )
      text( "Press SPACE to skip the filling into its last point.", 100, 494 );
    else if ( mouseY > 70 && mouseY <= 480 && tool == "line" )
      text( "One left-click to draw a dot. Left-click drag and drop to draw a line.", 100, 494 );
    else if ( mouseY > 70 && mouseY <= 480 && tool == "ellipse" )
      text( "Left-click drag and drop to draw an ellipse.", 100, 494 );
    else if ( mouseY > 70 && mouseY <= 480 && tool == "pencil" )
      text( "Left-click drag and drop to draw on canvas with pencil.", 100, 494 );
    else if ( mouseY > 70 && mouseY <= 480 && tool == "fill" )
      text( "Left-click on an object in canvas to fill it with the selected color.", 100, 494 );
  }
  
  if ( mouseY <= 70 && pointsFillingStep.size() > 0 )
    text( "Press SPACE to skip the filling into its last point.", 5, 494 );
  
  // "SAVE" button in the ribbon hovered
  else if ( mouseX >= 6 && mouseX <= 29 && mouseY >= 10 && mouseY <= 32 ) {
    text( "Ctrl+S Save as image", 5, 494 );
    
  // "OPEN" button in the ribbon hovered
  } else if ( mouseX >= 32 && mouseX <= 55 && mouseY >= 10 && mouseY <= 32 ) {
    text( "Ctrl+O Open image", 5, 494 );
    
  // "UNDO" button in the ribbon hovered
  } else if ( undo.size() > 1 && mouseX >= 6 && mouseX <= 29 && mouseY >= 34 && mouseY <= 56 ) {
    text( "Ctrl+Z Undo an action", 5, 494 );
    
  // "REDO" button in the ribbon hovered
  } else if ( redo.size() > 0 && mouseX >= 32 && mouseX <= 55 && mouseY >= 34 && mouseY <= 56 ) {
    text( "Ctrl+Y Redo an action", 5, 494 );
    
  // "CLEAR" button in the ribbon hovered
  } else if ( mouseX >= 376 && mouseX <= 422 && mouseY <= 70 ) {
    text( "Clear canvas", 5, 494 );
    
  // "LINE" tool in the ribbon hovered
  } else if (mouseX >= 432 && mouseX <= 452 && mouseY >= 10 && mouseY <= 30) {
    text( "Line tool", 5, 494 );
  
  // "ELLIPSE" tool in the ribbon hovered
  } else if (mouseX >= 457 && mouseX <= 477 && mouseY >= 10 && mouseY <= 30) {
    text( "Ellipse tool", 5, 494 );
    
  // "PENCIL" tool in the ribbon hovered
  } else if (mouseX >= 432 && mouseX <= 452 && mouseY >= 34 && mouseY <= 54) {
    text( "Pencil tool", 5, 494 );
  
  // "SHOW FILLING ORDER" option in the ribbon hovered
  } else if ( mouseX >= 490 && mouseX <= 630 && mouseY >= 11 && mouseY <= 31 ) {
    if ( showFillingOrder )
      text( "Deactivate show filling order option for fill tool", 5, 494 );
    else
      text( "Activate show filling order option for fill tool", 5, 494 );
      
  // "SELECT BOUNDARY COLOR" button in the ribbon hovered
  } else if ( waitSelectBoundary || mouseX >= 490 && mouseX <= 636 && mouseY >= 33 && mouseY <= 52 ) {
    if ( waitSelectBoundary )
      text( "Click on any position in the program (ribbon/canvas/status bar) which has the desired boundary color", 5, 494 );
    else
      text( "Choose the boundary color for boundary fill", 5, 494 );
    
  // "FILL" (paint bucket) tool/options in the ribbon hovered
  } else if ( optFillOn || mouseX >= 457 && mouseX <= 477 && mouseY >= 34 && mouseY <= 54) {
    text( "Fill tool", 5, 494 );
    
  // "SIZE" option in the ribbon hovered
  } else if ( optSizeOn || mouseX >= 331 && mouseX <= 375 && mouseY <= 70 ) {
    text( "Choose stroke size", 5, 494 );
  }
}
