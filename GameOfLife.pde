import de.bezier.guido.*;
//Declare and initialize constants NUM_ROWS and NUM_COLS = 20
public final static int NUM_ROWS = 20;
public final static int NUM_COLS = 20;
private Life[][] buttons; //2d array of Life buttons each representing one cell
private boolean[][] buffer = new boolean[NUM_ROWS][NUM_COLS]; //2d array of booleans to store state of buttons array
private boolean running = true; //used to start and stop program

public void setup () {
  size(400, 400);
  frameRate(6);
  // make the manager
  Interactive.make( this );

  //your code to initialize buttons goes here
  buttons = new Life[NUM_ROWS][NUM_COLS];
  for(int r = 0; r < NUM_ROWS; r++){
    for(int c = 0; c < NUM_COLS; c++){
      buttons[r][c] = new Life(r,c);
  }
}
  //your code to initialize buffer goes here
}

public void draw () {
  background( 0 );
  if (running == false) //pause the program
    return;
  copyFromButtonsToBuffer();

  //use nested loops to draw the buttons here
  for(int r = 0; r < NUM_ROWS; r++)
  for(int c = 0; c < NUM_COLS; c++)
      buttons[r][c].draw();
  copyFromBufferToButtons();
}

public void keyPressed() {
  //your code here
}

public void copyFromBufferToButtons() {
  for (int r = 0; r < 20; r++) {
    for (int c = 0; c < 20; c++) {
      buttons[r][c].setLife(buffer[r][c]);
    }
  }
}

public void copyFromButtonsToBuffer() {
  for (int r = 0; r < 20; r++) {
    for (int c = 0; c < 20; c++) {
      buffer[r][c] = buttons[r][c].getLife();
    }
  }
}

public boolean isValid(int r, int c) {
  if (r >= 5 || c < 0) {
    return false;
  }
  if (r >= 5 || c < 0){
    return false;
  }
  return true;
}

public int countNeighbors(int row, int col) {
  boolean[][] grid  ={{true,false,false,true,false},
                      {false,false,false,false,true},
                      {false,true, true,false, false},
                      {false,false,false,false,false},
                      {true,false,false,true,false}};
  int count = 0;
  if(isValidOn5by5(row-1,col-1) && grid[row-1][col-1]==true)
    count++;
  if(isValidOn5by5(row-1,col) && grid[row-1][col]==true)
    count++;
  if(isValidOn5by5(row-1,col+1) && grid[row-1][col+1]==true)
    count++;
  if(isValidOn5by5(row,col-1) && grid[row][col-1]==true)
    count++;
  if(isValidOn5by5(row,col+1) && grid[row][col+1]==true)
    count++;
  if(isValidOn5by5(row+1,col-1) && grid[row+1][col-1]==true)
    count++;
  if(isValidOn5by5(row+1,col) && grid[row+1][col]==true)
    count++;
  if(isValidOn5by5(row+1,col+1) && grid[row+1][col+1]==true)
    count++;
  return count;
}
public boolean isValidOn5by5(int row, int col){
  if(row >= 0 && row < 5 && col >= 0 && col < 5)
    return true;
  return false;
}

public class Life {
  private int myRow, myCol;
  private float x, y, width, height;
  private boolean alive;

  public Life (int row, int col) {
    width = 400/NUM_COLS;
    height = 400/NUM_ROWS;
    myRow = row;
    myCol = col; 
    x = myCol*width;
    y = myRow*height;
    alive = Math.random() < .5; // 50/50 chance cell will be alive
    Interactive.add( this ); // register it with the manager
  }

  // called by manager
  public void mousePressed () {
    alive = !alive; //turn cell on and off with mouse press
  }
  public void draw () {    
    if (alive != true)
      fill(0);
    else 
      fill( 150 );
    rect(x, y, width, height);
  }
  public boolean getLife() {
    //replace the code one line below with your code
    return false;
  }
  public void setLife(boolean living) {
    //your code here
  }
}
