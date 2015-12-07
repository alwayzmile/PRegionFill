// showRibbon.pde
// procedures related to the ribbon interface

void showRibbon() {  
  noStroke(); // No stroke for ribbon
  fill( 230, 237, 237 );
  rect( 0, 0, 800, 70 );  // Ribbon
  stroke( 150 );
  strokeWeight( 1 );
  line( 0, 70, 800, 70 );  // Bottom-line of ribbon
  
  ////////////////////////////////////////////////////////////////////////////
  // SAVE & OPEN, UNDO & REDO
  ////////////////////////////////////////////////////////////////////////////
  // save button hovered
  if ( mouseX >= 6 && mouseX <= 29 && mouseY >= 10 && mouseY <= 32 ) {
    fill( 240 );
    stroke( #79ADFF );
    rect( 6, 10, 23, 22 );
  } else if ( mouseX >= 32 && mouseX <= 55 && mouseY >= 10 && mouseY <= 32 ) {
    fill( 240 );
    stroke( #79ADFF );
    rect( 32, 10, 23, 22 );
  } else if ( mouseX >= 6 && mouseX <= 29 && mouseY >= 34 && mouseY <= 56 ) {
    fill( 240 );
    stroke( #79ADFF );
    rect( 6, 34, 23, 22 );
  } else if ( mouseX >= 32 && mouseX <= 55 && mouseY >= 34 && mouseY <= 56 ) {
    fill( 240 );
    stroke( #79ADFF );
    rect( 32, 34, 23, 22 );
  }
  
  // 'save' icon
  img = loadImage( "Save-icon.png" );
  image( img, 8, 12 );
  
  // 'open' icon
  img = loadImage( "Open-icon.png" );
  image( img, 34, 12 );
  
  // 'undo' icon
  if ( undo.size() > 1 )
    img = loadImage( "Undo-icon.png" );
  else
    img = loadImage( "Undo-no-icon.png" );
  image( img, 10, 38 );
  
  // 'redo' icon
  if ( redo.size() > 0 )
    img = loadImage( "Redo-icon.png" );
  else
    img = loadImage( "Redo-no-icon.png" );
  image( img, 36, 38 );
  
  //** Tool/option group divider between save&open and color
  stroke( 189, 193, 193 );
  strokeWeight( 1 );
  line( 62, 0, 62, 70 );
  
  ////////////////////////////////////////////////////////////////////////////
  // COLOR OPTION
  ////////////////////////////////////////////////////////////////////////////
  fill( selectedColor );
  stroke( 255 );
  rect( 73, 15, 25, 25 );
  fill( 20 );
  text( "Color", 72, 55 );
  
  // when mouse hovered a certain color, highlight it
  for ( int i = 0; i < 12; i++ ) {
    if ( (mouseX >= (106+i*18) && mouseX <= (122+i*18) && mouseY >= 8 && mouseY <= 24) ) {
      fill( #A7EDFF );
      stroke( #17CFFF );
    } else {
      fill( 255 );
      stroke( 200 );
    }
    rect( 106+i*18, 8, 16, 16 );
    
    if ( (mouseX >= (106+i*18) && mouseX <= (122+i*18) && mouseY >= 25 && mouseY <= 41) ) {
      fill( #A7EDFF );
      stroke( #17CFFF );
    } else {
      fill( 255 );
      stroke( 200 );
    }
    rect( 106+i*18, 25, 16, 16 );
    
    if ( (mouseX >= (106+i*18) && mouseX <= (122+i*18) && mouseY >= 42 && mouseY <= 58) ) {
      fill( #A7EDFF );
      stroke( #17CFFF );
    } else {
      fill( 255 );
      stroke( 200 );
    }
    rect( 106+i*18, 42, 16, 16 ); 
  }
  
  // display colors
  for ( int i = 0; i < 12; i++ ) {
    fill( colors[i] );
    stroke( colors[i] );
    rect( 108+i*18, 10, 12, 12 );
    
    fill( colors[i+12] );
    stroke( colors[i+12] );
    rect( 108+i*18, 27, 12, 12 );
    
    fill( colors[i+24] );
    stroke( colors[i+24] );
    rect( 108+i*18, 44, 12, 12 ); 
  }
  
  //** Tool/option group divider
  stroke( 189, 193, 193 );
  strokeWeight( 1 );
  line( 330, 0, 330, 70 );
  
  ////////////////////////////////////////////////////////////////////////////
  // LINE SIZE OPTION
  ////////////////////////////////////////////////////////////////////////////
  // Line option hovered
  if ( mouseX >= 331 && mouseX <= 375 && mouseY <= 70 ) {
    noStroke();
    fill( 240 );
    rect( 331, 0, 44, 70 );
  }
  
  if ( optSizeOn ) {
    noStroke();
    fill( 240 );
    rect( 331, 0, 44, 70 );
    
    stroke( 200 );
    fill( 255 );
    rect( 330, 70, 100, 100 );
   
    for ( int i = 0; i < 5; i++ ) {
      if ( mouseX >= 331 && mouseX <= 431 && mouseY > (70+20*i) && mouseY < (90+20*i) ) {
        noStroke();
        fill( 240 );
        rect( 331, (71+i*20), 99, 19 );
      }
      stroke( 41, 61, 62 );
      strokeWeight( 1+i );
      line( 341, (80+20*i), 421, (80+20*i) );
    }
  }
  
  strokeCap( SQUARE );
  stroke( 41, 61, 62 );  // Icon for line size tool
  strokeWeight( 1 );
  line( 341, 15, 365, 15 );
  strokeWeight( 2 );
  line( 341, 22, 365, 22 );
  strokeWeight( 3 );
  line( 341, 29, 365, 29 );
  strokeWeight( 4 );
  line( 341, 36, 365, 36 );
  fill( 20 );
  text( "Size", 343, 55 );
  
  stroke( 189, 193, 193 );  // Tool/option group divider
  strokeWeight( 1 );
  line( 375, 0, 375, 70 );
  
  ////////////////////////////////////////////////////////////////////////////
  // CLEAR CANVAS OPTION
  //////////////////////////////////////////////////////////////////////////// 
  // Clear option hovered
  if ( mouseX >= 376 && mouseX <= 422 && mouseY <= 70 ) {
    noStroke();
    fill( 240 );
    rect( 376, 0, 47, 70 );
  }
  
  stroke( 200 );
  fill( 255 );
  rect( 384, 10, 30, 30 );
  fill( 20 );
  text( "Clear", 386, 55 );
  line( 390, 15, 408, 35 );
  line( 408, 15, 390, 35 );
  
  stroke( 189, 193, 193 );  // Tool/option group divider
  strokeWeight( 1 );
  line( 422, 0, 422, 70 );
  
  ////////////////////////////////////////////////////////////////////////////
  // TOOL BOX
  //////////////////////////////////////////////////////////////////////////// 
  // When a tool hovered, highlight it
  stroke( #79ADFF );
  fill( 240 );
  if ( tool == "line" || (mouseX >= 432 && mouseX <= 452 && mouseY >= 10 && mouseY <= 30) ) 
    rect( 432, 10, 20, 20 );
  
  if ( tool == "ellipse" || (mouseX >= 457 && mouseX <= 477 && mouseY >= 10 && mouseY <= 30) )
    rect( 457, 10, 20, 20 );
    
  if ( tool == "pencil" || (mouseX >= 432 && mouseX <= 452 && mouseY >= 34 && mouseY <= 54) )
    rect( 432, 34, 20, 20 );
    
  if ( tool == "fill" || (mouseX >= 457 && mouseX <= 477 && mouseY >= 34 && mouseY <= 54) )
    rect( 457, 34, 20, 20 );
  
  // line tool icon
  fill( #DEEBFF );
  line( 435, 13, 449, 27 );
  
  // ellipse tool icon
  noFill();
  ellipse( 467, 20, 16, 16 );
  
  // rectangular selection tool icon
  img = loadImage( "Pencil-icon.png" );
  image( img, 435, 37 );
  
  // polygon selection tool icon
  img = loadImage( "Fill-icon.png" );
  image( img, 460, 37 );
  
  stroke( 189, 193, 193 );  // Tool/option group divider
  strokeWeight( 1 );
  line( 485, 0, 485, 70 );
  
  ////////////////////////////////////////////////////////////////////////////
  // FILL TOOL OPTIONS MENU
  ////////////////////////////////////////////////////////////////////////////
  if ( optFillOn ) {
    stroke( 200 );
    fill( 255 );
    rect( 457, 54, 170, fillOptions.length*20+1 );
   
    for ( int i = 0; i < fillOptions.length; i++ ) {
      if ( fillOptionIndex == i || mouseX >= 457 && mouseX <= 627 && mouseY > (54+20*i) && mouseY < (74+20*i) ) {
        noStroke();
        fill( 240 );
        rect( 458, (55+i*20), 169, 20 );
      }
      
      fill(20);
      text(fillOptions[i], 465, 68+i*20);
    }
  }
  
  ////////////////////////////////////////////////////////////////////////////
  // FILL TOOL OPTIONS
  ////////////////////////////////////////////////////////////////////////////  
  // Show filling order checkbox
  if ( mouseX >= 490 && mouseX <= 630 && mouseY >= 11 && mouseY <= 31 ) {
    stroke( #79ADFF );
    fill( 240 );
    rect( 490, 11, 140, 20 );
  }
  
  if ( showFillingOrder )
    img = loadImage( "checkbox_checked.png" );
  else
    img = loadImage( "checkbox_unchecked.png" );
  
  image( img, 495, 15 );
  fill( 20 );
  text( "Show pixel filled order", 510, 25 );
  
  // Choose boundary color
  if ( waitSelectBoundary || mouseX >= 490 && mouseX <= 636 && mouseY >= 33 && mouseY <= 52 ) {
    stroke( #79ADFF );
    fill( 240 );
    rect( 490, 33, 146, 20 );
  }
  fill( boundaryColor );
  strokeCap( SQUARE );
  stroke( 255 );
  rect( 495, 37, 12, 12 );
  
  fill( 20 );
  text( "Choose boundary color", 510, 47 );
}

// event handler when elements in the ribbon clicked
void showRibbonClicked() {  
  ////////////////////////////////////////////////////////////////////////////
  // SAVE & OPEN, UNDO & REDO
  //////////////////////////////////////////////////////////////////////////// 
  // Save button clicked
  if ( mouseX >= 6 && mouseX <= 29 && mouseY >= 10 && mouseY <= 32 ) {
    saveCanvas();
  } else if ( mouseX >= 32 && mouseX <= 55 && mouseY >= 10 && mouseY <= 32 ) {
    showOpenDialog();
  } else if ( mouseX >= 6 && mouseX <= 29 && mouseY >= 34 && mouseY <= 56 ) {
    doUndo();
  } else if ( mouseX >= 32 && mouseX <= 55 && mouseY >= 34 && mouseY <= 56 ) {
    doRedo();
  }
  
  ////////////////////////////////////////////////////////////////////////////
  // COLOR OPTION
  ////////////////////////////////////////////////////////////////////////////
  for ( int i = 0; i < 12; i++ ) {
    if ( (mouseX >= (106+i*18) && mouseX <= (122+i*18) && mouseY >= 8 && mouseY <= 24) )
      selectedColor = colors[i];
    else if ( (mouseX >= (106+i*18) && mouseX <= (122+i*18) && mouseY >= 25 && mouseY <= 41) )
      selectedColor = colors[i+12];
    else if ( (mouseX >= (106+i*18) && mouseX <= (122+i*18) && mouseY >= 42 && mouseY <= 58) )
      selectedColor = colors[i+24];
  }
  
  ////////////////////////////////////////////////////////////////////////////
  // LINE SIZE OPTION
  //////////////////////////////////////////////////////////////////////////// 
  // Clicked outside the line size option
  if ( optSizeOn && (mouseX < 331 || mouseX > 431 || mouseY > 170 || (mouseX>375 && mouseY<70)) ) {
    optSizeOn = false;
    canvasOn = true;
    restoreDrawing();
  } 
  
  if ( mouseX >= 331 && mouseX <= 375 && mouseY <= 70 ) {  // Size icon clicked
    canvasOn = false;
    optSizeOn = true;
  }
  
  for ( int i = 0; i < 5; i++ ) {  // a line size choice clicked
    if ( optSizeOn && mouseX >= 331 && mouseX <= 431 && mouseY > (70+20*i) && mouseY < (90+20*i) ) {
        lineSize = 1+i;
        optSizeOn = false;
        canvasOn = true;
        restoreDrawing();
    }
  }
  
  ////////////////////////////////////////////////////////////////////////////
  // CLEAR CANVAS OPTION
  ////////////////////////////////////////////////////////////////////////////
  if ( mouseX >= 376 && mouseX <= 422 && mouseY <= 70 ) {
    pg.background( 255 );
    tmp.clear();
  }
  
  ////////////////////////////////////////////////////////////////////////////
  // TOOL BOX
  //////////////////////////////////////////////////////////////////////////// 
  if (mouseX >= 432 && mouseX <= 452 && mouseY >= 10 && mouseY <= 30) {
    tool = "line";
  }
  
  if (mouseX >= 457 && mouseX <= 477 && mouseY >= 10 && mouseY <= 30) {
    tool = "ellipse";
  }
    
  if (mouseX >= 432 && mouseX <= 452 && mouseY >= 34 && mouseY <= 54) {
    tool = "pencil";
  }
    
  if (mouseX >= 457 && mouseX <= 477 && mouseY >= 34 && mouseY <= 54) {
    tool = "fill";
    canvasOn = false;
    optFillOn = true;
  }
  
  ////////////////////////////////////////////////////////////////////////////
  // FILL TOOL OPTION MENU
  //////////////////////////////////////////////////////////////////////////// 
  // Clicked outside fill option
  if ( optFillOn && (mouseX < 457 || mouseX > 627 || mouseY > (74+20*fillOptions.length) || mouseY < 34 || (mouseX>477 && mouseY<54)) ) {
    optFillOn = false;
    canvasOn = true;
    restoreDrawing();
  }
  
  for ( int i = 0; i < fillOptions.length; i++ ) {
    if ( optFillOn && mouseX >= 457 && mouseX <= 627 && mouseY > (54+20*i) && mouseY < (74+20*i) ) {
      fillOptionIndex = i;
      optFillOn = false;
      canvasOn = true;
      restoreDrawing();
    }
  }
  
  ////////////////////////////////////////////////////////////////////////////
  // FILL TOOL OPTIONS
  ////////////////////////////////////////////////////////////////////////////
  // Show filling order checkbox
  if ( mouseX >= 490 && mouseX <= 630 && mouseY >= 11 && mouseY <= 31 ) {
    showFillingOrder = !showFillingOrder;
  }
  
  // Choose boundary color
  if ( mouseX >= 490 && mouseX <= 636 && mouseY >= 33 && mouseY <= 52 ) {
    JOptionPane.showMessageDialog(null, "Click anywhere in the program to choose boundary color.", "Choose Boundary Color", JOptionPane.INFORMATION_MESSAGE);
    waitSelectBoundary = true;
    canvasOn = false;
  }
}
