void keyPressed() {
  if ( keyCode == CONTROL ) {
    //print( "CONTROL_PRESSED\n" );
    ctrlPressed = true;
  }
  
  if ( char(keyCode)=='Z' && ctrlPressed ) {
    //print( "CtrlZ_PRESSED\n" );
    doUndo();
  }
  
  if ( char(keyCode)=='Y' && ctrlPressed ) {
    //print( "CtrlY_PRESSED\n" );
    doRedo();
  }
  
  if ( char(keyCode)=='S' && ctrlPressed ) {
    //print( "CtrlS_PRESSED\n" );
    saveCanvas();
  }
  
  if ( char(keyCode)=='O' && ctrlPressed ) {
    //print( "CtrlO_PRESSED\n" );
    showOpenDialog();
  }
}

void keyReleased() {
  if ( keyCode == CONTROL ) {
    ctrlPressed = false;
//    print( "CONTROL_RELEASED\n" );
  }
  
  if ( pointsFillingStep.size() > 0 && char(keyCode) == ' ' ) {
    pointsFillingStep.clear();
    doUndo();
    doRedo();
  }
}
