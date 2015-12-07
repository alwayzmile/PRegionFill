class Fill {
  public color tc, c0, bc;
  public int x, y;
  public boolean animated = false;
  private ArrayList<Point> fillingStep = new ArrayList<Point>();
  
  // constructors
  public Fill() {}
  
  public Fill( int x, int y, color tc ) {
    this.x = x;
    this.y = y;
    this.tc = tc;
    this.c0 = getOriginalColor(x, y);
  }
  
  public Fill( int x, int y, color tc, color bc ) {
    this.x = x;
    this.y = y;
    this.tc = tc;
    this.bc = bc;
    this.c0 = getOriginalColor(x, y);
  }
  
  private color getOriginalColor( int x, int y ) {
    return tmp.get(x, y);
  }
  
  public boolean isColored() {
    return c0 == tc;
  }
  
  public void setAnimated( boolean animated ) {
    this.animated = animated;
  }
  
  public void FloodFillRecursive() {
    //print( "TEST " + x + "\n" );
    //print( "c0=" + c0 + "\n" );
    
    if ( !isColored() ) {
      doFloodFillRecursive( this.x, this.y );
    }
  }
  
  private void doFloodFillRecursive( int xx, int yy ) {
    if ( this.animated ) {
      fillingStep.add( new Point( xx, yy ) );
    }
    tmp.strokeWeight( 1 );
    tmp.stroke( tc );
    tmp.point( xx, yy );
    //tmp.noStroke();
    //tmp.fill(tc);
    //tmp.rect(xx, yy, 1, 1);
    
    if ( xx > 0 ) {
      //print( "TEST1 " + xx + "\n" );
      if ( tmp.get( xx-1, yy ) == c0 )
        doFloodFillRecursive( xx-1, yy );
    }
    
    if ( yy > 0 ) {
      //print( "TEST2 " + xx + "\n" );
      if ( tmp.get( xx, yy-1 ) == c0 )
        doFloodFillRecursive( xx, yy-1 );
    }
    
    // the x coordinate of canvas is from 0 to width-1
    if ( xx < tmp.width-1 ) {
      //print( "TEST3 " + xx + "\n" );
      if ( tmp.get( xx+1, yy ) == c0 )
        doFloodFillRecursive( xx+1, yy );
    }
    
    // the y coordinate of canvas is from 0 to height-1
    if ( yy < tmp.height-1 ) {
      //print( "TEST4 " + xx + "\n" );
      if ( tmp.get( xx, yy+1 ) == c0 )
        doFloodFillRecursive( xx, yy+1 );
    }
  }
  
  public void BoundaryFillRecursive() {
    //print( "TEST " + this.x + "\n" );
    //print( "tc=" + tc + "\n" );
    //print( "bc=" + bc + "\n" );
    
    if ( tmp.get(this.x, this.y) != bc ) {
      doBoundaryFillRecursive( this.x, this.y );
    }
  }
  
  // works best when strokeweight of all shapes = 1
//  private void doBoundaryFillRecursive( int xx, int yy ) {
//    if ( tmp.get(xx, yy)!=bc && tmp.get(xx,yy)!=tc ) {
//      if ( this.animated ) {
//        fillingStep.add( new Point( xx, yy ) );
//      }
//      tmp.strokeWeight( 1 );
//      tmp.stroke( tc );
//      tmp.point( xx, yy );
//      //tmp.noStroke();
//      //tmp.fill(tc);
//      //tmp.rect(xx, yy, 1, 1);
//      //print( "(" + xx + "," + yy + ")" + " " );
//      
//      if ( xx > 1 ) {
//        //print( "TEST1 " + xx + "\n" );
//        if ( tmp.get( xx-1, yy )==bc ) {
//          // do nothing
//        } else if ( tmp.get( xx-1, yy )!=tc ) {
//          //print( "duh12" );
//          doBoundaryFillRecursive( xx-1, yy );
//        } else if ( tmp.get( xx-2, yy )!=tc ) {
//          //print( "duh13" );
//          doBoundaryFillRecursive( xx-2, yy );
//        }
//      }
//      
//      if ( yy > 1 ) {
//        //print( "TEST2 " + xx + "\n" );
//        if ( tmp.get( xx, yy-1 )==bc ) {
//          // do nothing
//        } else if ( tmp.get( xx, yy-1 )!=tc ) {
//          //print( "duh22" );
//          doBoundaryFillRecursive( xx, yy-1 );
//        } else if ( tmp.get( xx, yy-2 )!=tc ) {
//          //print( "duh23" );
//          doBoundaryFillRecursive( xx, yy-2 );
//        }
//      }
//      
//      // the x coordinate of canvas is from 0 to width-1
//      if ( xx < tmp.width-2 ) {
//        //print( "TEST3 " + xx + "\n" );
//        if ( tmp.get( xx+1, yy )==bc ) {
//          // do nothing
//        } else if ( tmp.get( xx+1, yy )!=tc ) {
//          //print( "duh31" );
//          doBoundaryFillRecursive( xx+1, yy );
//        } else if ( tmp.get( xx+2, yy )!=tc ) {
//          //print( "duh33" );
//          doBoundaryFillRecursive( xx+2, yy );
//        }
//      }
//      
//      // the y coordinate of canvas is from 0 to height-1
//      if ( yy < tmp.height-2 ) {
//        //print( "TEST4 " + xx + "\n" );
//        if ( tmp.get( xx, yy+1 )==bc ) {
//          // do nothing
//        } else if ( tmp.get( xx, yy+1 )!=tc ) {
//          //print( "duh42" );
//          doBoundaryFillRecursive( xx, yy+1 );
//        } else if ( tmp.get( xx, yy+2 )!=tc ) {
//          //print( "duh43" );
//          doBoundaryFillRecursive( xx, yy+2 );
//        }
//      }
//    }
//  }
  
  // doesn't work for a shape contains shape which has the same color as target color
  private void doBoundaryFillRecursive( int xx, int yy ) {
    if ( this.animated ) {
      fillingStep.add( new Point( xx, yy ) );
    }
    tmp.strokeWeight( 1 );
    tmp.stroke( tc );
    tmp.point( xx, yy );
    //tmp.noStroke();
    //tmp.fill(tc);
    //tmp.rect(xx, yy, 1, 1);
    
    if ( xx > 0 ) {
      //print( "TEST1 " + xx + "\n" );
      if ( tmp.get( xx-1, yy )!=bc && tmp.get( xx-1, yy )!=tc )
        doBoundaryFillRecursive( xx-1, yy );
    }
    
    if ( yy > 0 ) {
      //print( "TEST2 " + xx + "\n" );
      if ( tmp.get( xx, yy-1 )!=bc && tmp.get( xx, yy-1 )!=tc )
        doBoundaryFillRecursive( xx, yy-1 );
    }
    
    if ( xx < tmp.width-1 ) {
      //print( "TEST3 " + xx + "\n" );
      if ( tmp.get( xx+1, yy )!=bc && tmp.get( xx+1, yy )!=tc )
        doBoundaryFillRecursive( xx+1, yy );
    }
    
    if ( yy < tmp.height-1 ) {
      //print( "TEST4 " + xx + "\n" );
      if ( tmp.get( xx, yy+1 )!=bc && tmp.get( xx, yy+1 )!=tc )
        doBoundaryFillRecursive( xx, yy+1 );
    }
  }
  
  // Using 8-way
  // doesn't work for shape with strokeweight <= 1
//  private void doBoundaryFillRecursive( int xx, int yy ) {
//    if ( this.animated ) {
//      fillingStep.add( new Point( xx, yy ) );
//    }
//    tmp.strokeWeight( 1 );
//    tmp.stroke( tc );
//    tmp.point( xx, yy );
//    //tmp.noStroke();
//    //tmp.fill(tc);
//    //tmp.rect(xx, yy, 1, 1);
//    
//    if ( xx > 0 ) {
//      //print( "TEST1 " + xx + "\n" );
//      if ( tmp.get( xx-1, yy )!=bc && tmp.get( xx-1, yy )!=tc )
//        doBoundaryFillRecursive( xx-1, yy );
//        
//      if ( yy > 0 )
//        if ( tmp.get( xx-1, yy-1 )!=bc && tmp.get( xx-1, yy-1 )!=tc )
//          doBoundaryFillRecursive( xx-1, yy-1 );
//    }
//    
//    if ( yy > 0 ) {
//      //print( "TEST2 " + xx + "\n" );
//      if ( tmp.get( xx, yy-1 )!=bc && tmp.get( xx, yy-1 )!=tc )
//        doBoundaryFillRecursive( xx, yy-1 );
//        
//      if ( xx < tmp.width-1 )
//        if ( tmp.get( xx+1, yy-1 )!=bc && tmp.get( xx+1, yy-1 )!=tc )
//          doBoundaryFillRecursive( xx+1, yy-1 );
//    }
//    
//    if ( xx < tmp.width-1 ) {
//      //print( "TEST3 " + xx + "\n" );
//      if ( tmp.get( xx+1, yy )!=bc && tmp.get( xx+1, yy )!=tc )
//        doBoundaryFillRecursive( xx+1, yy );
//        
//      if ( yy < tmp.height-1 )
//        if ( tmp.get( xx+1, yy+1 )!=bc && tmp.get( xx+1, yy+1 )!=tc )
//          doBoundaryFillRecursive( xx+1, yy+1 );
//    }
//    
//    if ( yy < tmp.height-1 ) {
//      //print( "TEST4 " + xx + "\n" );
//      if ( tmp.get( xx, yy+1 )!=bc && tmp.get( xx, yy+1 )!=tc )
//        doBoundaryFillRecursive( xx, yy+1 );
//        
//      if ( xx > 0 )
//        if ( tmp.get( xx-1, yy+1 )!=bc && tmp.get( xx-1, yy+1 )!=tc )
//          doBoundaryFillRecursive( xx-1, yy+1 );
//    }
//  }
  
  void FloodFillStack() {
    //print( "TEST " + x + "\n" );
    //print( "c0=" + c0 + "\n" );
    
    if ( !isColored() ) {
      //print( "TEST " + this.x + "\n" );
      Point tmpPoint;
      Stack points = new Stack();
      points.push( new Point(this.x, this.y) );
      
      while ( !points.empty() ) {
        tmpPoint = (Point)points.pop();
        //print( "TEST " + tmpPoint.x + "\n" );
        
        if ( tmp.get( tmpPoint.x, tmpPoint.y ) == c0 ) {
          if ( this.animated ) {
            fillingStep.add( new Point( tmpPoint.x, tmpPoint.y ) );
          }
          tmp.strokeWeight( 1 );
          tmp.stroke( tc );
          tmp.point( tmpPoint.x, tmpPoint.y );
          //tmp.noStroke();
          //tmp.fill(tc);
          //tmp.rect( tmpPoint.x, tmpPoint.y, 1, 1 );
          if ( tmpPoint.x > 0 ) {
            //print( "TEST1 " + tmpPoint.x + "\n" );
            if ( tmp.get( tmpPoint.x-1, tmpPoint.y ) == c0 )
              points.push( new Point(tmpPoint.x-1, tmpPoint.y) );
          }
          
          if ( tmpPoint.y > 0 ) {
            //print( "TEST2 " + tmpPoint.x + "\n" );
            if ( tmp.get( tmpPoint.x, tmpPoint.y-1 ) == c0 )
              points.push( new Point(tmpPoint.x, tmpPoint.y-1) );
          }
          
          if ( tmpPoint.x < tmp.width-1 ) {
            //print( "TEST3 " + tmpPoint.x + "\n" );
            if ( tmp.get( tmpPoint.x+1, tmpPoint.y ) == c0 )
              points.push( new Point(tmpPoint.x+1, tmpPoint.y) );
          }
          
          if ( tmpPoint.y < tmp.height-1 ) {
            //print( "TEST4 " + tmpPoint.x + "\n" );
            if ( tmp.get( tmpPoint.x, tmpPoint.y+1 ) == c0 )
              points.push( new Point(tmpPoint.x, tmpPoint.y+1) );
          }
        }
      }
      //print( points.empty() + "\n" );
    }
  }
  
  // works best when strokeweight of all shapes = 1
//  void BoundaryFillStack() {
//    //print( "TEST " + x + "\n" );
//    //print( "c0=" + c0 + "\n" );
//    
//    if ( tmp.get(this.x, this.y) != bc ) {
//      //print( "TEST " + this.x + "\n" );
//      Point tmpPoint;
//      Stack points = new Stack();
//      points.push( new Point(this.x, this.y) );
//      
//      while ( !points.empty() ) {
//        tmpPoint = (Point)points.pop();
//        //print( "TEST " + tmpPoint.x + "\n" );
//        
//        if ( tmp.get( tmpPoint.x, tmpPoint.y )!=bc && tmp.get( tmpPoint.x, tmpPoint.y )!=tc ) {
//          if ( this.animated ) {
//            fillingStep.add( new Point( tmpPoint.x, tmpPoint.y ) );
//          }
//          tmp.strokeWeight( 1 );
//          tmp.stroke( tc );
//          tmp.point( tmpPoint.x, tmpPoint.y );
//          //tmp.noStroke();
//          //tmp.fill(tc);
//          //tmp.rect( tmpPoint.x, tmpPoint.y, 1, 1 );
//          
//          if ( tmpPoint.x > 1 ) {
//            //print( "TEST1 " + tmpPoint.x + "\n" );
//            if ( tmp.get( tmpPoint.x-1, tmpPoint.y )==bc ) {
//              // do nothing
//            } else if (tmp.get( tmpPoint.x-1, tmpPoint.y )!=tc ) {
//              points.push( new Point(tmpPoint.x-1, tmpPoint.y) );
//            } else if (tmp.get( tmpPoint.x-2, tmpPoint.y )!=tc ) {
//              points.push( new Point(tmpPoint.x-2, tmpPoint.y) );
//            }
//          }
//          
//          if ( tmpPoint.y > 1 ) {
//            //print( "TEST2 " + tmpPoint.x + "\n" );
//            if ( tmp.get( tmpPoint.x, tmpPoint.y-1 )==bc ) {
//              // do nothing
//            } else if ( tmp.get( tmpPoint.x, tmpPoint.y-1 )!=tc ) {
//              points.push( new Point(tmpPoint.x, tmpPoint.y-1) );
//            } else if ( tmp.get( tmpPoint.x, tmpPoint.y-2 )!=tc ) {
//              points.push( new Point(tmpPoint.x, tmpPoint.y-2) );
//            }
//          }
//          
//          if ( tmpPoint.x < tmp.width-2 ) {
//            //print( "TEST3 " + tmpPoint.x + "\n" );
//            if ( tmp.get( tmpPoint.x+1, tmpPoint.y )==bc ) {
//              // do nothing
//            } else if ( tmp.get( tmpPoint.x+1, tmpPoint.y )!=tc ) {
//              points.push( new Point(tmpPoint.x+1, tmpPoint.y) );
//            } else if ( tmp.get( tmpPoint.x+2, tmpPoint.y )!=tc ) {
//              points.push( new Point(tmpPoint.x+2, tmpPoint.y) );
//            }
//          }
//          
//          if ( tmpPoint.y < tmp.height-2 ) {
//            //print( "TEST4 " + tmpPoint.x + "\n" );
//            if ( tmp.get( tmpPoint.x, tmpPoint.y+1 )==bc ) {
//              // do nothing
//            } else if ( tmp.get( tmpPoint.x, tmpPoint.y+1 )!=tc ) {
//              points.push( new Point(tmpPoint.x, tmpPoint.y+1) );
//            } else if ( tmp.get( tmpPoint.x, tmpPoint.y+2 )!=tc ) {
//              points.push( new Point(tmpPoint.x, tmpPoint.y+2) );
//            }
//          }
//        }
//      }
//      //print( points.empty() + "\n" );
//    }
//  }

  // doesn't work for a shape contains shape which has the same color as target color
  void BoundaryFillStack() {
    //print( "TEST " + x + "\n" );
    //print( "c0=" + c0 + "\n" );
    
    if ( tmp.get(this.x, this.y) != bc ) {
      //print( "TEST " + this.x + "\n" );
      Point tmpPoint;
      Stack points = new Stack();
      points.push( new Point(this.x, this.y) );
      
      while ( !points.empty() ) {
        tmpPoint = (Point)points.pop();
        //print( "TEST " + tmpPoint.x + "\n" );
        
        if ( tmp.get( tmpPoint.x, tmpPoint.y ) != tc && tmp.get( tmpPoint.x, tmpPoint.y ) != tc ) {
          if ( this.animated ) {
            fillingStep.add( new Point( tmpPoint.x, tmpPoint.y ) );
          }
          tmp.strokeWeight( 1 );
          tmp.stroke( tc );
          tmp.point( tmpPoint.x, tmpPoint.y );
          //tmp.noStroke();
          //tmp.fill(tc);
          //tmp.rect( tmpPoint.x, tmpPoint.y, 1, 1 );
          
          if ( tmpPoint.x > 0 ) {
            //print( "TEST1 " + tmpPoint.x + "\n" );
            if ( tmp.get( tmpPoint.x-1, tmpPoint.y )!=bc && tmp.get( tmpPoint.x-1, tmpPoint.y )!=tc )
              points.push( new Point(tmpPoint.x-1, tmpPoint.y) );
          }
          
          if ( tmpPoint.y > 0 ) {
            //print( "TEST2 " + tmpPoint.x + "\n" );
            if ( tmp.get( tmpPoint.x, tmpPoint.y-1 )!=bc && tmp.get( tmpPoint.x, tmpPoint.y-1 )!=tc )
              points.push( new Point(tmpPoint.x, tmpPoint.y-1) );
          }
          
          if ( tmpPoint.x < tmp.width-1 ) {
            //print( "TEST3 " + tmpPoint.x + "\n" );
            if ( tmp.get( tmpPoint.x+1, tmpPoint.y )!=bc && tmp.get( tmpPoint.x+1, tmpPoint.y )!=tc )
              points.push( new Point(tmpPoint.x+1, tmpPoint.y) );
          }
          
          if ( tmpPoint.y < tmp.height-1 ) {
            //print( "TEST4 " + tmpPoint.x + "\n" );
            if ( tmp.get( tmpPoint.x, tmpPoint.y+1 )!=bc && tmp.get( tmpPoint.x, tmpPoint.y+1 )!=tc )
              points.push( new Point(tmpPoint.x, tmpPoint.y+1) );
          }
        }
      }
      //print( points.empty() + "\n" );
    }
  }
    
  void FloodFillScanline() {
    //println( c0 );
    if ( !isColored() ) {
      doFloodFillScanline( this.x, this.y );
    }
  }
  
  // doesn't work when the stroke color of shape to be filled is = tc
//  private void doFloodFillScanline(int xx, int yy) {
//    int i = xx;
//    while ( tmp.get(i, yy) == c0 ) { // scan left
//      if ( this.animated ) {
//        fillingStep.add( new Point( i, yy ) );
//      }
//      tmp.strokeWeight(1);
//      tmp.stroke(tc);
//      tmp.point(i, yy);
//      //tmp.noStroke();
//      //tmp.fill(tc);
//      //tmp.rect(i, yy, 1, 1);
//      i--;
//    }
//    
//    i = xx + 1;
//    while ( tmp.get(i, yy) == c0 ) { // scan right
//      if ( this.animated ) {
//        fillingStep.add( new Point( i, yy ) );
//      }
//      tmp.strokeWeight(1);
//      tmp.stroke(tc);
//      tmp.point(i, yy);
//      //tmp.noStroke();
//      //tmp.fill(tc);
//      //tmp.rect(i, yy, 1, 1);
//      i++;
//    }
//    
//    i = xx;
//    while ( tmp.get(i, yy) == tc ) {
//      if ( tmp.get(i, yy+1) == c0 ) {
//        doFloodFillScanline( i, yy+1 );
//      }
//      i++;
//    }
//    i = xx-1;
//    while ( tmp.get(i, yy) == tc ) {
//      if ( tmp.get(i, yy+1) == c0 ) {
//        doFloodFillScanline( i, yy+1 );
//      }
//      i--;
//    }
//    
//    i = xx;
//    while ( tmp.get(i, yy) == tc ) {
//      if ( tmp.get(i, yy-1) == c0 ) {
//        doFloodFillScanline( i, yy-1 );
//      }
//      i++;
//    }
//    i = xx-1;
//    while ( tmp.get(i, yy) == tc ) {
//      if ( tmp.get(i, yy-1) == c0 ) {
//        doFloodFillScanline( i, yy-1 );
//      }
//      i--;
//    }
//  }
  
  private void doFloodFillScanline(int xx, int yy) {
    int i = xx, iMin, iMax;
    while ( tmp.get(i, yy) == c0 ) { // scan left
      if ( this.animated ) {
        fillingStep.add( new Point( i, yy ) );
      }
      tmp.strokeWeight(1);
      tmp.stroke(tc);
      tmp.point(i, yy);
      //tmp.noStroke();
      //tmp.fill(tc);
      //tmp.rect(i, yy, 1, 1);
      i--;
    }
    iMin = i + 1;
    
    i = xx + 1;
    while ( tmp.get(i, yy) == c0 ) { // scan right
      if ( this.animated ) {
        fillingStep.add( new Point( i, yy ) );
      }
      tmp.strokeWeight(1);
      tmp.stroke(tc);
      tmp.point(i, yy);
      //tmp.noStroke();
      //tmp.fill(tc);
      //tmp.rect(i, yy, 1, 1);
      i++;
    }
    iMax = i - 1;
    
    i = xx;
    while ( i <= iMax ) {
      if ( tmp.get(i, yy+1) == c0 ) {
        doFloodFillScanline( i, yy+1 );
      }
      i++;
    }
    i = xx-1;
    while ( i >= iMin ) {
      if ( tmp.get(i, yy+1) == c0 ) {
        doFloodFillScanline( i, yy+1 );
      }
      i--;
    }
    
    i = xx;
    while ( i <= iMax ) {
      if ( tmp.get(i, yy-1) == c0 ) {
        doFloodFillScanline( i, yy-1 );
      }
      i++;
    }
    i = xx-1;
    while ( i >= iMin ) {
      if ( tmp.get(i, yy-1) == c0 ) {
        doFloodFillScanline( i, yy-1 );
      }
      i--;
    }
  }
  
  // using recursive way
  void BoundaryFillScanline() {
    //println( c0 );
    if ( tmp.get(this.x, this.y) != bc ) {
      doBoundaryFillScanline( this.x, this.y );
    }
  }
  
  // doesn't work when the stroke color of shape to be filled is = tc
//  private void doBoundaryFillScanline(int xx, int yy) {
//    //print( "a " );
//    int i = xx;
//    while ( tmp.get(i, yy) != bc && tmp.get(i, yy) != tc && i >= 0 ) { // scan left
//      //print( "b1" + i + " " );
//      if ( this.animated ) {
//        fillingStep.add( new Point( i, yy ) );
//      }
//      tmp.strokeWeight(1);
//      tmp.stroke(tc);
//      tmp.point(i, yy);
//      //tmp.noStroke();
//      //tmp.fill(tc);
//      //tmp.rect(i, yy, 1, 1);
//      i--;
//    }
//    
//    i = xx + 1;
//    while ( tmp.get(i, yy) != bc && tmp.get(i, yy) != tc && i <= tmp.width-1 ) { // scan right
//      //print( "b2" + i + " " );
//      if ( this.animated ) {
//        fillingStep.add( new Point( i, yy ) );
//      }
//      tmp.strokeWeight(1);
//      tmp.stroke(tc);
//      tmp.point(i, yy);
//      //tmp.noStroke();
//      //tmp.fill(tc);
//      //tmp.rect(i, yy, 1, 1);
//      i++;
//    }
//    
//    i = xx;
//    while ( tmp.get(i, yy) == tc ) {
//      //print( "c " );
//      if ( tmp.get(i, yy+1) != bc && tmp.get(i, yy+1) != tc ) {
//        doBoundaryFillScanline( i, yy+1 );
//      }
//      i++;
//    }
//    i = xx-1;
//    while ( tmp.get(i, yy) == tc ) {
//      //print( "d " );
//      if ( tmp.get(i, yy+1) != bc && tmp.get(i, yy+1) != tc ) {
//        doBoundaryFillScanline( i, yy+1 );
//      }
//      i--;
//    }
//    
//    i = xx;
//    while ( tmp.get(i, yy) == tc ) {
//      //print( "e " );
//      if ( tmp.get(i, yy-1) != bc && tmp.get(i, yy-1) != tc ) {
//        doBoundaryFillScanline( i, yy-1 );
//      }
//      i++;
//    }
//    i = xx-1;
//    while ( tmp.get(i, yy) == tc ) {
//      //print( "f " );
//      if ( tmp.get(i, yy-1) != bc && tmp.get(i, yy-1) != tc ) {
//        doBoundaryFillScanline( i, yy-1 );
//      }
//      i--;
//    }
//  }
  
  private void doBoundaryFillScanline(int xx, int yy) {
    //print( "a " );
    int i = xx, iMax, iMin;
    while ( tmp.get(i, yy) != bc && i >= 0 ) { // scan left
      //print( "b1" + i + " " );
      if ( this.animated ) {
        fillingStep.add( new Point( i, yy ) );
      }
      tmp.strokeWeight(1);
      tmp.stroke(tc);
      tmp.point(i, yy);
      //tmp.noStroke();
      //tmp.fill(tc);
      //tmp.rect(i, yy, 1, 1);
      i--;
    }
    iMin = i+1;
    //print( "min=" + iMin + " " );
    
    i = xx + 1;
    while ( tmp.get(i, yy) != bc && i <= tmp.width-1 ) { // scan right
      //print( "b2" + i + " " );
      if ( this.animated ) {
        fillingStep.add( new Point( i, yy ) );
      }
      tmp.strokeWeight(1);
      tmp.stroke(tc);
      tmp.point(i, yy);
      //tmp.noStroke();
      //tmp.fill(tc);
      //tmp.rect(i, yy, 1, 1);
      i++;
    }
    iMax = i-1;
    //print( "max=" + iMax + " " );
    
    if ( yy < tmp.height-1 ) {
      i = xx;
      while ( i <= iMax ) {
        //print( "c " );
        if ( tmp.get(i, yy+1) != bc && tmp.get(i, yy+1) != tc ) {
          doBoundaryFillScanline( i, yy+1 );
        }
        i++;
      }
      i = xx-1;
      while ( i >= iMin ) {
        //print( "d " );
        if ( tmp.get(i, yy+1) != bc && tmp.get(i, yy+1) != tc ) {
          doBoundaryFillScanline( i, yy+1 );
        }
        i--;
      }
    }
    
    i = xx;
    if ( yy > 0 ) {
      while ( i <= iMax ) {
        //print( "e " );
        if ( tmp.get(i, yy-1) != bc && tmp.get(i, yy-1) != tc ) {
          doBoundaryFillScanline( i, yy-1 );
        }
        i++;
      }
      i = xx-1;
      while ( i >= iMin ) {
        //print( "f " );
        if ( tmp.get(i, yy-1) != bc && tmp.get(i, yy-1) != tc ) {
          doBoundaryFillScanline( i, yy-1 );
        }
        i--;
      }
    }
  }
  
  // using stack
//  void BoundaryFillScanline() {
//    //println( c0 );
//    if ( tmp.get(this.x, this.y) != bc ) {
//      //print( "a " );
//      int i, iMax, iMin;
//      Point tmpPoint;
//      Stack points = new Stack();
//      points.push( new Point(this.x, this.y) );
//      
//      while ( !points.empty() ) {
//        tmpPoint = (Point)points.pop();
//        //print( "(" + tmpPoint.x + "," + tmpPoint.y + ") " );
//        
//        i = tmpPoint.x;
//        while ( tmp.get(i, tmpPoint.y) != bc && i >= 0 ) { // scan left
//          //print( "b1" + i + " " );
//          if ( tmp.get(i, tmpPoint.y) != tc ) {
//            if ( this.animated ) {
//              fillingStep.add( new Point( i, tmpPoint.y ) );
//            }
//            tmp.strokeWeight(1);
//            tmp.stroke(tc);
//            tmp.point(i, tmpPoint.y);
//            //tmp.noStroke();
//            //tmp.fill(tc);
//            //tmp.rect(i, tmpPoint.y, 1, 1);
//          }
//          i--;
//        }
//        iMin = i+1;
//        //print( "min=" + iMin + " " );
//        
//        i = tmpPoint.x + 1;
//        while ( tmp.get(i, tmpPoint.y) != bc && i <= tmp.width-1 ) { // scan right
//          //print( "b2" + i + " " );
//          if ( tmp.get(i, tmpPoint.y) != tc ) {
//            if ( this.animated ) {
//              fillingStep.add( new Point( i, tmpPoint.y ) );
//            }
//            tmp.strokeWeight(1);
//            tmp.stroke(tc);
//            tmp.point(i, tmpPoint.y);
//            //tmp.noStroke();
//            //tmp.fill(tc);
//            //tmp.rect(i, tmpPoint.y, 1, 1);
//          }
//          i++;
//        }
//        iMax = i-1;
//        //print( "max=" + iMax + " " );
//        
//        i = tmpPoint.x;
//        if ( tmpPoint.y < tmp.height-1 ) {
//          while ( i <= iMax ) {
//            //print( "c " );
//            if ( tmp.get(i, tmpPoint.y+1) != bc && tmp.get(i, tmpPoint.y+1) != tc ) {
//              points.push( new Point(i, tmpPoint.y+1) );
//            }
//            i++;
//          }
//          i = tmpPoint.x-1;
//          while ( i >= iMin ) {
//            //print( "d " );
//            if ( tmp.get(i, tmpPoint.y+1) != bc && tmp.get(i, tmpPoint.y+1) != tc ) {
//              points.push( new Point(i, tmpPoint.y+1) );
//            }
//            i--;
//          }
//        }
//        
//        i = tmpPoint.x;
//        if ( tmpPoint.y > 0 ) {
//          while ( i <= iMax ) {
//            //print( "e " );
//            if ( tmp.get(i, tmpPoint.y-1) != bc && tmp.get(i, tmpPoint.y-1) != tc ) {
//              points.push( new Point(i, tmpPoint.y-1) );
//            }
//            i++;
//          }
//          i = tmpPoint.x-1;
//          while ( i >= iMin ) {
//            //print( "f " );
//            if ( tmp.get(i, tmpPoint.y-1) != bc && tmp.get(i, tmpPoint.y-1) != tc ) {
//              points.push( new Point(i, tmpPoint.y-1) );
//            }
//            i--;
//          }
//        }
//      }
//    }
//  }
  
  void FloodFillScanlineStack() {
    int i;
    boolean spanAbove, spanBelow;
    Point tmpPoint;
    Stack points = new Stack();
    
    if ( !isColored() ) {
      points.push( new Point(this.x, this.y) );
      
      while ( !points.empty() ) {
        tmpPoint = (Point)points.pop();
        i = tmpPoint.x;
        while ( tmp.get(i-1, tmpPoint.y) == c0 ) {
          i--;
        }
        
        spanAbove = false;
        spanBelow = false;
        while ( tmp.get(i, tmpPoint.y) == c0 ) {
          if ( this.animated ) {
            fillingStep.add( new Point( i, tmpPoint.y ) );
          }
          tmp.strokeWeight(1);
          tmp.stroke(tc);
          tmp.point(i, tmpPoint.y);
          //tmp.noStroke();
          //tmp.fill(tc);
          //tmp.rect(i, tmpPoint.y, 1, 1);
          
          if ( tmpPoint.y > 0 ) {
            if ( !spanAbove && tmp.get(i, tmpPoint.y-1)==c0 ) {
              points.push( new Point(i, tmpPoint.y-1) );
              spanAbove = true;
            } else if ( spanAbove && tmp.get(i, tmpPoint.y-1)!=c0 ) {
              spanAbove = false;
            }
          }
          
          if ( tmpPoint.y < tmp.height-1 ) {
            if ( !spanBelow && tmp.get(i, tmpPoint.y+1)==c0 ) {
              points.push( new Point(i, tmpPoint.y+1) );
              spanBelow = true;
            } else if ( spanBelow && tmp.get(i, tmpPoint.y+1)!=c0 ) {
              spanBelow = false;
            }
          }
          
          i++;
        }
      }
    }
  }
  
  void BoundaryFillScanlineStack() {
    int i;
    boolean spanAbove, spanBelow;
    Point tmpPoint;
    Stack points = new Stack();
    
    if ( tmp.get(this.x, this.y) != bc ) {
      points.push( new Point(this.x, this.y) );
      
      while ( !points.empty() ) {
        //print( "a " );
        tmpPoint = (Point)points.pop();
        i = tmpPoint.x;
        
        if ( i > 0 ) {
          while ( tmp.get(i-1, tmpPoint.y) != bc ) {
            i--;
            if ( i == 0 ) break;
          }
        }
        
        spanAbove = false;
        spanBelow = false;
        while ( tmp.get(i, tmpPoint.y) != bc && i < tmp.width ) {
          //print( "b " );
          if ( this.animated ) {
            fillingStep.add( new Point( i, tmpPoint.y ) );
          }
          tmp.strokeWeight(1);
          tmp.stroke(tc);
          tmp.point(i, tmpPoint.y);
          //tmp.noStroke();
          //tmp.fill(tc);
          //tmp.rect(i, tmpPoint.y, 1, 1);
          
          if ( tmpPoint.y > 0 ) {
            if ( !spanAbove && tmp.get(i, tmpPoint.y-1)!=bc && tmp.get(i, tmpPoint.y-1)!=tc ) {
              points.push( new Point(i, tmpPoint.y-1) );
              spanAbove = true;
            } else if ( spanAbove && (tmp.get(i, tmpPoint.y-1)==bc || tmp.get(i, tmpPoint.y-1)==tc)  ) {
              spanAbove = false;
            }
          }
          
          if ( tmpPoint.y < tmp.height-1 ) {
            if ( !spanBelow && tmp.get(i, tmpPoint.y+1)!=bc && tmp.get(i, tmpPoint.y+1)!=tc ) {
              points.push( new Point(i, tmpPoint.y+1) );
              spanBelow = true;
            } else if ( spanBelow && (tmp.get(i, tmpPoint.y+1)==bc || tmp.get(i, tmpPoint.y+1)==tc) ) {
              spanBelow = false;
            }
          }
          
          i++;
        }
      }
    }
  }
  
  void FillStripHoriPattern() {
    int i;
    boolean spanAbove, spanBelow;
    Point tmpPoint;
    Stack points = new Stack();
    
    if ( !isColored() ) {
      points.push( new Point(this.x, this.y) );
      
      while ( !points.empty() ) {
        tmpPoint = (Point)points.pop();
        i = tmpPoint.x;
        while ( tmp.get(i-1, tmpPoint.y) == c0 ) {
          i--;
        }
        
        spanAbove = false;
        spanBelow = false;
        while ( tmp.get(i, tmpPoint.y) == c0 ) {
          if ( this.animated ) {
            fillingStep.add( new Point( i, tmpPoint.y ) );
          }
          tmp.strokeWeight(1);
          tmp.stroke(tc);
          tmp.point(i, tmpPoint.y);
          //tmp.noStroke();
          //tmp.fill(tc);
          //tmp.rect(i, tmpPoint.y, 1, 1);
          
          if ( tmpPoint.y > 0 ) {
            if ( !spanAbove && tmp.get(i, tmpPoint.y-1)==c0 && tmp.get(i, tmpPoint.y-2)==c0 ) {
              points.push( new Point(i, tmpPoint.y-2) );
              spanAbove = true;
            } else if ( spanAbove && tmp.get(i, tmpPoint.y-1)==c0 && tmp.get(i, tmpPoint.y-2)!=c0 ) {
              spanAbove = false;
            }
          }
          
          if ( tmpPoint.y < tmp.height-1 ) {
            if ( !spanBelow && tmp.get(i, tmpPoint.y+1)==c0 && tmp.get(i, tmpPoint.y+2)==c0 ) {
              points.push( new Point(i, tmpPoint.y+2) );
              spanBelow = true;
            } else if ( spanBelow && tmp.get(i, tmpPoint.y+1)==c0 && tmp.get(i, tmpPoint.y+2)!=c0 ) {
              spanBelow = false;
            }
          }
          
          i++;
        }
      }
    }
  }
  
  void FillStripVertiPattern() {
    int i;
    boolean spanLeft, spanRight;
    Point tmpPoint;
    Stack points = new Stack();
    
    if ( !isColored() ) {
      points.push( new Point(this.x, this.y) );
      
      while ( !points.empty() ) {
        tmpPoint = (Point)points.pop();
        i = tmpPoint.y;
        while ( tmp.get(tmpPoint.x, i-1) == c0 ) {
          i--;
        }
        
        spanLeft = false;
        spanRight = false;
        while ( tmp.get(tmpPoint.x, i) == c0 ) {
          if ( this.animated ) {
            fillingStep.add( new Point( tmpPoint.x, i ) );
          }
          tmp.strokeWeight(1);
          tmp.stroke(tc);
          tmp.point(tmpPoint.x, i);
          //tmp.noStroke();
          //tmp.fill(tc);
          //tmp.rect(tmpPoint.x, i, 1, 1);
          
          if ( tmpPoint.x > 0 ) {
            if ( !spanLeft && tmp.get(tmpPoint.x-1, i)==c0 && tmp.get(tmpPoint.x-2, i)==c0 ) {
              points.push( new Point(tmpPoint.x-2, i) );
              spanLeft = true;
            } else if ( spanLeft && tmp.get(tmpPoint.x-1, i)==c0 && tmp.get(tmpPoint.x-2, i)!=c0 ) {
              spanLeft = false;
            }
          }
          
          if ( tmpPoint.x < tmp.width-1 ) {
            if ( !spanRight && tmp.get(tmpPoint.x+1, i)==c0 && tmp.get(tmpPoint.x+2, i)==c0 ) {
              points.push( new Point(tmpPoint.x+2, i) );
              spanRight = true;
            } else if ( spanRight && tmp.get(tmpPoint.x+1, i)==c0 && tmp.get(tmpPoint.x+2, i)!=c0 ) {
              spanRight = false;
            }
          }
          
          i++;
        }
      }
    }
  }
  
  void FillCheckeredPattern() {
    //print( "TEST " + x + "\n" );
    //print( "c0=" + c0 + "\n" );
    
    if ( !isColored() ) {
      //print( "TEST " + this.x + "\n" );
      Point tmpPoint;
      Stack points = new Stack();
      points.push( new Point(this.x, this.y) );
      
      while ( !points.empty() ) {
        tmpPoint = (Point)points.pop();
        print( "TEST " + tmpPoint.x + "\n" );
        
        if ( tmp.get( tmpPoint.x, tmpPoint.y ) == c0 ) {
          if ( this.animated ) {
            fillingStep.add( new Point( tmpPoint.x, tmpPoint.y ) );
          }
          tmp.strokeWeight( 1 );
          tmp.stroke( tc );
          tmp.point( tmpPoint.x, tmpPoint.y );
          //tmp.noStroke();
          //tmp.fill(tc);
          //tmp.rect( tmpPoint.x, tmpPoint.y, 1, 1 );
          if ( tmp.get( tmpPoint.x-1, tmpPoint.y ) == c0 && 
               tmp.get( tmpPoint.x, tmpPoint.y-1 ) == c0 && 
               tmp.get( tmpPoint.x+1, tmpPoint.y ) == c0 && 
               tmp.get( tmpPoint.x, tmpPoint.y+1 ) == c0 ) {
            if ( tmpPoint.x > 0 ) {
              //print( "TEST1 " + tmpPoint.x + "\n" );
              if ( tmp.get( tmpPoint.x-1, tmpPoint.y-1 ) == c0 )
                points.push( new Point(tmpPoint.x-1, tmpPoint.y-1) );
            }
            
            if ( tmpPoint.y > 0 ) {
              //print( "TEST2 " + tmpPoint.x + "\n" );
              if ( tmp.get( tmpPoint.x+1, tmpPoint.y-1 ) == c0 )
                points.push( new Point(tmpPoint.x+1, tmpPoint.y-1) );
            }
            
            if ( tmpPoint.x < tmp.width-1 ) {
              //print( "TEST3 " + tmpPoint.x + "\n" );
              if ( tmp.get( tmpPoint.x+1, tmpPoint.y+1 ) == c0 )
                points.push( new Point(tmpPoint.x+1, tmpPoint.y+1) );
            }
            
            if ( tmpPoint.y < tmp.height-1 ) {
              //print( "TEST4 " + tmpPoint.x + "\n" );
              if ( tmp.get( tmpPoint.x-1, tmpPoint.y+1 ) == c0 )
                points.push( new Point(tmpPoint.x-1, tmpPoint.y+1) );
            }
          }
        }
      }
      //print( points.empty() + "\n" );
    }
  }
  
  public ArrayList<Point> getFillingStep() {
    ArrayList<Point> tmpFillingStep = fillingStep;
//    print( "tmpFillingStep.size() " + tmpFillingStep.size() + "\n" );
    fillingStep = new ArrayList<Point>();
//    print( "tmpFillingStep.size() " + tmpFillingStep.size() + "\n" );
    return tmpFillingStep;
  }
}
