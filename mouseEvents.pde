// mouseKeyEvents.pde
// functions that are called when user do a specific action by using mouse or keyboard

void mousePressed() {
  if ( canvasOn && pointsFillingStep.size()==0 && mouseButton == LEFT ) {
    // As start point in drawing object
    x01 = mouseX;
    y01 = mouseY - 71;
    
    // Hide the status info "done saving" from status bar
    if ( isDoneSaving ) isDoneSaving = false;
  }
}

void mouseReleased() {
  if ( canvasOn && y01 >= 0  && y01 <= 410 && pointsFillingStep.size()==0 && mouseButton == LEFT ) { // When will we draw on canvas?
    ribbonOn = true;
    
    x02 = mouseX;
    y02 = mouseY - 71;
    
    if ( tool == "line" ) {
      tmp.strokeWeight( lineSize );
      tmp.stroke( selectedColor );
      tmp.line( x01, y01, x02, y02 );
      restoreDrawing();
    } else if ( tool == "ellipse" ) {
      if ( Rx != 0 ) {
        tmp.strokeWeight( lineSize );
        tmp.stroke( selectedColor );
        tmp.ellipseMode( RADIUS );
        tmp.noFill();
        tmp.ellipse( x01, y01, Rx, Ry );
        restoreDrawing();
        Rx = 0;
        Ry = 0;
      }
    } else if ( tool == "fill" ) {
      if ( y02 >= 0  && y02 <= 410 ) {
//        print( "Line Size1=" + lineSize + "\n" );
        fill = new Fill( x02, y02, selectedColor, boundaryColor );
        if ( showFillingOrder ) fill.setAnimated( true );
        
        if ( fillOptionIndex == 0 ) {  // "Flood fill recursive"
          try {
            fillingStartMs = millis();
            fill.FloodFillRecursive();
            fillingEndMs = millis();
            
            println( "Time for flood fill recursive (" + fill.x + "," + fill.y + "): " + (fillingEndMs-fillingStartMs) + "ms" );
          } catch ( StackOverflowError e ) {
            JOptionPane.showMessageDialog(null, "Stack overflow!\nCtrl+Z to undo filling.", "ERROR!", JOptionPane.ERROR_MESSAGE);
            println( "Flood fill recursive ends with stack overflow" );
          }
        } else if ( fillOptionIndex == 1 ) {  // "Flood fill with stack"
          fillingStartMs = millis();
          fill.FloodFillStack();
          fillingEndMs = millis();
          
          println( "Time for flood fill with stack (" + fill.x + "," + fill.y + "): " + (fillingEndMs-fillingStartMs) + "ms" );
        } else if ( fillOptionIndex == 2 ) {
          fillingStartMs = millis();
          fill.FloodFillScanline();
          fillingEndMs = millis();
          
          println( "Time for flood fill scanline (" + fill.x + "," + fill.y + "): " + (fillingEndMs-fillingStartMs) + "ms" );
        } else if ( fillOptionIndex == 3 ) {
          fillingStartMs = millis();
          fill.FloodFillScanlineStack();
          fillingEndMs = millis();
          println( "Time for flood fill scanline (stack) (" + fill.x + "," + fill.y + "): " + (fillingEndMs-fillingStartMs) + "ms" );
        } else if ( fillOptionIndex == 4 ) {
          try {
            fillingStartMs = millis();
            fill.BoundaryFillRecursive();
            fillingEndMs = millis();
            
            println( "Time for boundary fill recursive (" + fill.x + "," + fill.y + "): " + (fillingEndMs-fillingStartMs) + "ms" );
          } catch ( StackOverflowError e ) {
            JOptionPane.showMessageDialog(null, "Stack overflow!\nCtrl+Z to undo filling.", "ERROR!", JOptionPane.ERROR_MESSAGE);
            println( "Boundary fill recursive ends with stack overflow" );
          }
        } else if ( fillOptionIndex == 5 ) {  // "Boundary fill with stack"
          fillingStartMs = millis();
          fill.BoundaryFillStack();
          fillingEndMs = millis();
          
          println( "Time for boundary fill with stack (" + fill.x + "," + fill.y + "): " + (fillingEndMs-fillingStartMs) + "ms" );
        } else if ( fillOptionIndex == 6 ) {
          //fillingStartMs = millis();
          //fill.BoundaryFillScanline();
          //fillingEndMs = millis();
          //println( "Time for boundary fill scanline px to px (" + fill.x + "," + fill.y + "): " + (fillingEndMs-fillingStartMs) + "ms" );

          try {
            fillingStartMs = millis();
            fill.BoundaryFillScanline();
            fillingEndMs = millis();
            
            println( "Time for boundary fill scanline px to px (" + fill.x + "," + fill.y + "): " + (fillingEndMs-fillingStartMs) + "ms" );
          } catch ( StackOverflowError e ) {
            JOptionPane.showMessageDialog(null, "Stack overflow!\nCtrl+Z to undo filling.", "ERROR!", JOptionPane.ERROR_MESSAGE);
            println( "Boundary fill scanline px to px ends with stack overflow" );
          }
        } else if ( fillOptionIndex == 7 ) {
          fillingStartMs = millis();
          fill.BoundaryFillScanlineStack();
          fillingEndMs = millis();
          
          println( "Time for boundary fill scanline (stack) (" + fill.x + "," + fill.y + "): " + (fillingEndMs-fillingStartMs) + "ms" );
        } else if ( fillOptionIndex == 8 ) {
          fillingStartMs = millis();
          fill.FillStripHoriPattern();
          fillingEndMs = millis();
          
          println( "Time for fill horizontal striped pattern (" + fill.x + "," + fill.y + "): " + (fillingEndMs-fillingStartMs) + "ms" );
        } else if ( fillOptionIndex == 9 ) {
          fillingStartMs = millis();
          fill.FillStripVertiPattern();
          fillingEndMs = millis();
          
          println( "Time for fill vertical striped pattern (" + fill.x + "," + fill.y + "): " + (fillingEndMs-fillingStartMs) + "ms" );
        } else if ( fillOptionIndex == 10 ) {
          fillingStartMs = millis();
          fill.FillCheckeredPattern();
          fillingEndMs = millis();
          
          println( "Time for fill checkered pattern (" + fill.x + "," + fill.y + "): " + (fillingEndMs-fillingStartMs) + "ms" );
        }
        
        if ( showFillingOrder ) {
          pointsFillingStep = fill.getFillingStep();
        }
        
        restoreDrawing();
      }
    }
    
    if ( undo.size() >= 20 ) {
      undo.remove(0);
      undo.add( createGraphics(tmp.width, tmp.height) );
      undo.get(undo.size()-1).image( tmp, 0, 0 );
 //   print( "Add undo\n" );
    } else {
      undo.add( createGraphics(tmp.width, tmp.height) );
      undo.get(undo.size()-1).image(tmp, 0, 0);
 //   print( "Add undo\n" );
    }
    
    if ( tool == "fill" ) {
      if ( fill.animated ) {
        unredoTmp = undo.get(undo.size()-2);
        unredoTmp.loadPixels();
        tmp = createGraphics(pg.width, pg.height);
        tmp.loadPixels();
        arrayCopy( unredoTmp.pixels, tmp.pixels );
        tmp.updatePixels();
        restoreDrawing();
      }
    }
//    undo.get(0).save("data/test2.png");
//    print( "Size0: " + undo.size() + "\n" );
    redo.clear();
  }
}

void mouseDragged() {
  if ( canvasOn && y01 >= 0  && y01 <= 410 && pointsFillingStep.size()==0 && mouseButton == LEFT  ) {  // When will we draw on canvas?
    ribbonOn = false;
    
    x02 = mouseX;
    y02 = mouseY - 71;
      
    if ( tool == "line" ) {
      restoreDrawing();
      pg.strokeWeight( lineSize );
      pg.stroke( selectedColor );
      pg.line( x01, y01, x02, y02 );
    } else if ( tool == "ellipse" ) {
      Rx = abs( x01 - x02 );
      Ry = abs( y01 - y02 );
      
      restoreDrawing();
      pg.strokeWeight( lineSize );
      pg.stroke( selectedColor );
      pg.ellipseMode( RADIUS );
      pg.noFill();
      pg.ellipse( x01, y01, Rx, Ry );
    } else if ( tool == "pencil" ) {
      tmp.strokeWeight( lineSize );
      tmp.stroke( selectedColor );
      tmp.line( mouseX, mouseY-71, pmouseX, pmouseY-71 );
      restoreDrawing();
    }
  }
}

void mouseClicked() {  
  if ( waitSelectBoundary ) {
    boundaryColor = get( mouseX, mouseY );
    canvasOn = true;
    waitSelectBoundary = false;
  } else if ( pointsFillingStep.size()==0 && mouseButton == LEFT && ribbonOn ) {
    showRibbonClicked();
  }
}
