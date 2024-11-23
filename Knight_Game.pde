PImage menu_img;
PImage player, grass, dirt, cobble;
PFont medieval;
int start_button = 173, bindings_button = 243, quit_button = 313, selector = 173;
int up_bind_y = 170, down_bind_y = 225, left_bind_y = 280, right_bind_y = 335;
char up_bind = 'w', down_bind = 's', left_bind = 'a', right_bind = 'd';
int player_x = 120, player_y = 240;
boolean showTipsScreen = true, showMenuScreen = false, showStartArea = false, showBindingsScreen = false;

void setup() {
  size(900, 600);
  background(255);
  menu_img = loadImage("soldier.jpeg");
  player = loadImage("knight_char.png");
  grass = loadImage("grass.jpg");
  dirt = loadImage("dirt.jpg");
  cobble = loadImage("cobble.jpg");
  medieval = createFont("MedievalSharp-Regular.ttf", 128);
}

void draw() {
  
  // Checks if the tips screen is visible
  if(showTipsScreen == true) {
    background(0);
    textFont(medieval);
    textSize(60);
    text("READ BEFORE CONTINUING", 90, 100);
    textSize(25);
    text("Make sure caps lock is off before continuing", 200, 220);
    text("There is no save system. Do not press ESC", 215, 300);
    textSize(30);
    text("Press Any Key To Continue", 255, 500);
    
    // Shows the menu when a key is pressed
    if(keyPressed && key != ENTER) {
      showTipsScreen = false;
      showMenuScreen = true;
    }
  }
  
  
  
  if(showMenuScreen == true) {
    textFont(medieval);
    image(menu_img, 300, 0, 600, 600);
    
    // Creates the Start and Quit buttons
    stroke(0);
    strokeWeight(1);
    fill(0);
    rect(0, 0, 300, height);
    
    // Highlights the Start button when selected
    if(selector == start_button) {
      stroke(255);
      strokeWeight(4);
      fill(40, 170, 30);
      rect(60, start_button, 182, 50, 16);
    } else {
        stroke(255);
        strokeWeight(4);
        fill(0);
        rect(60, start_button, 182, 50, 16);
    }
    
    // Highlights the Bindings button when selected
    if(selector == bindings_button) {
      stroke(255);
      strokeWeight(4);
      fill(40, 170, 30);
      rect(60, bindings_button, 182, 50, 16);
    } else {
        strokeWeight(4);
        fill(0);
        rect(60, bindings_button, 182, 50, 16);
    }
    
    // Highlights the Quit button when selected
    if(selector == quit_button) {
      strokeWeight(4);
      fill(40, 170, 30);
      rect(60, quit_button, 182, 50, 16);
    } else {
        strokeWeight(4);
        fill(0);
        rect(60, quit_button, 182, 50, 16);
    }
    
    // Labels the menu buttons
    textSize(40);
    fill(255);
    text("Start", 76, 212);
    text("Bindings", 74, 281);
    text("Quit", 76, 350);
    
    // Moves selector UP if the UP key is pressed
    if(keyPressed && ((key == CODED && keyCode == UP) || (key == 'w' || key == 'W')) && selector != start_button) {
      selector = selector - 70;
      keyPressed = false;
      
      // Moves selector DOWN if the DOWN key is pressed
    } else if (keyPressed && ((key == CODED && keyCode == DOWN) || (key == 's' || key == 'S')) && selector != quit_button) {
        selector = selector + 70;
        keyPressed = false;
    }
    
    // Gives the menu buttons function
    if(keyPressed && key == ENTER && selector == start_button) {
      showMenuScreen = false;
      showStartArea = true;
    } else if (keyPressed && key == ENTER && selector == bindings_button) {
        showMenuScreen = false;
        showBindingsScreen = true;
    } else if (keyPressed && key == ENTER && selector == quit_button) {
        exit();
    }
  }
  
  // Checks if the bindings screen is displayed
  if(showBindingsScreen == true) {
    if(selector == bindings_button) {
      selector = 170;
    }
    background(0);
    fill(255);
    textSize(60);
    text("Keybindings", 250, 80);
      
    // Moves selector UP if the UP key is pressed
    if(keyPressed && ((key == CODED && keyCode == UP) || (key == 'w' || key == 'W')) && selector != up_bind_y) {
      selector = selector - 55;
      keyPressed = false;
      
      // Moves selector DOWN if the DOWN key is pressed.
    } else if (keyPressed && ((key == CODED && keyCode == DOWN) || (key == 's' || key == 'S')) && selector != right_bind_y) {
        selector = selector + 55;
        keyPressed = false;
    }
      
    // Highlights the Up button when selected
    if(selector == up_bind_y) {
      fill(40, 170, 30);
      textSize(30);
      text("Up:  " + up_bind, 115, 170);
      if(keyPressed && key == ENTER) {
        keyPressed = false;
      }
    } else {
        fill(255);
        textSize(30);
        text("Up:  " + up_bind, 115, 170);
    }
      
    // Highlights the Left button when selected
    if(selector == left_bind_y) {
      fill(40, 170, 30);
      textSize(30);
      text("Left:  " + left_bind, 115, 280);
    } else {
        fill(255);
        textSize(30);
        text("Left:  " + left_bind, 115, 280);
    }
      
    // Highlights the Down button when selected
    if(selector == down_bind_y) {
      fill(40, 170, 30);
      textSize(30);
      text("Down:  " + down_bind, 115, 220);
    } else {
        fill(255);
        textSize(30);
        text("Down:  " + down_bind, 115, 220);
    }
      
    // Highlights the Right button when selected
    if(selector == right_bind_y) {
      fill(40, 170, 30);
      textSize(30);
      text("Right:  " + right_bind, 115, 335);
    } else {
        fill(255);
        textSize(30);
        text("Right:  " + right_bind, 115, 335);
    }
    
    fill(255);
    textSize(15);
    text("Press B to return to the menu", 20, 580);
     
    // Returns to the menu when b is pressed
    if(keyPressed && (key == 'b' || key == 'B')) {
      showBindingsScreen = false;
      showMenuScreen = true;
      selector = start_button;
      keyPressed = false;
    }
  }
  
  
  
  // Checks if the start area is visible
  if(showStartArea == true) {
    background(255);
    for(int x = 0; x < 900; x += 60) {
      for(int y = 0; y < 600; y += 60) {
        strokeWeight(2);
        stroke(40, 170, 35);
        fill(45, 200, 60);
        image(grass, x, y, 60, 60);
      }
    }
    
    image(player, player_x, player_y, 60, 60);
    if(key == 'p') {
      fill(0, 0, 0, 128);
      rect(0, 0, width, height);
    }
    
    // Moves the player up when up is pressed
    if(keyPressed && key == up_bind && player_y != 0) {
      player_y = player_y - 60;
      keyPressed = false;
      
      // Moves the player left when the left key is pressed
    } else if (keyPressed && key == left_bind && player_x != 0) {
        player_x = player_x - 60;
        keyPressed = false;
        
      // Moves the player down when the down key is pressed
    } else if (keyPressed && key == down_bind && player_y != 540) {
        player_y = player_y + 60;
        keyPressed = false;
        
      // Moves the player right when the right key is pressed
    } else if (keyPressed && key == right_bind && player_x != 840) {
        player_x = player_x + 60;
        keyPressed = false;
    }
  }
}
