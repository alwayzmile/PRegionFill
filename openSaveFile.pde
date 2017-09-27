// openSaveFile.pde
// procedures related to open saved dots/lines and exporting dots/lines into a file

void saveCanvas() {
  FileDialog save = new FileDialog((java.awt.Frame) null, "Save canvas as...", 1); // mode 1 = SAVE, 0 = OPEN
  save.setFile( "untitled.png" );
  save.setVisible(true);
  
  if ( save.getFile() != null ) {
    //!!!!!!!!!!!!!!!!! JPG or PNG or What???    
    pg.save( save.getDirectory() + save.getFile() );
    
    isDoneSaving = true;
  }
}

void showOpenDialog() {
  selectInput( "Open saved canvas", "openSavedCanvas" );
}

void openSavedCanvas( File input ) {
  if ( input != null ) {
    try {
      img = loadImage( input.getAbsolutePath() );
      tmp.image( img, 0, 0 );
      restoreDrawing();
      
      if ( undo.size() >= 20 ) {
        undo.remove(0);
        undo.add( createGraphics(tmp.width, tmp.height) );
        undo.get(undo.size()-1).beginDraw();
        undo.get(undo.size()-1).image( tmp, 0, 0 );
        //print( "Add undo\n" );
      } else {
        undo.add( createGraphics(tmp.width, tmp.height) );
        undo.get(undo.size()-1).beginDraw();
        undo.get(undo.size()-1).image(tmp, 0, 0);
        //print( "Add undo\n" );
      }
    } catch ( Exception e ) {
      JOptionPane.showMessageDialog(null, input.getName() + " is not a valid file", "ERROR!", JOptionPane.ERROR_MESSAGE);
    }
  }
}