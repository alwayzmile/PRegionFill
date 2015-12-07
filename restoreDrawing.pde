// restoreDrawing.pde

// Clear canvas and draw needed objects
void restoreDrawing() {
  tmp.endDraw();
  pg.background( 255 );
  pg.image( tmp, 0, 0 );
  tmp.beginDraw();
  tmp.noSmooth();
}
