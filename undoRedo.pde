void doUndo() {
  if ( undo.size() > 1 ) {
//    print( "Size1: " + undo.size() + "\n" );
    redo.add(undo.remove( undo.size()-1 ));
//    print( "Size2: " + undo.size() + "\n" );
    
    unredoTmp = undo.get(undo.size()-1);
    unredoTmp.loadPixels();
    tmp = createGraphics(pg.width, pg.height);
    tmp.beginDraw();
    tmp.loadPixels();
    arrayCopy( unredoTmp.pixels, tmp.pixels );
    tmp.updatePixels();
    
//    tmp.fill( #ff0000 );
//    tmp.text( undo.size(), 10, 10 );
//    tmp.save( "data/test.png" );
    restoreDrawing();
  }
}

void doRedo() {
    if ( redo.size() > 0 ) {
//    print( "Size1: " + undo.size() + "\n" );
    unredoTmp = redo.remove( redo.size()-1 );
    undo.add(unredoTmp);
//    print( "Size2: " + undo.size() + "\n" );
    
    unredoTmp.loadPixels();
    tmp = createGraphics(pg.width, pg.height);
    tmp.beginDraw();
    tmp.loadPixels();
    arrayCopy( unredoTmp.pixels, tmp.pixels );
    tmp.updatePixels();
    
//    tmp.fill( #ff0000 );
//    tmp.text( undo.size(), 10, 10 );
//    tmp.save( "data/test.png" );
    restoreDrawing();
  }
}