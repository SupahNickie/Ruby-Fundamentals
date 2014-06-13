function Map(string) {
  this.x_bound = parseInt(string.split(" ")[0]);
  this.y_bound = parseInt(string.split(" ")[1]);

  this.printRoverPosition = function(rover) {
    console.log("Rover is at position (" + rover.x_position + ", " + rover.y_position + ") with the current heading " + rover.heading);
  }
}

function Rover(string) {
  this.init = function(string) {
    this.x_position = parseInt(string.split(" ")[0]);
    this.y_position = parseInt(string.split(" ")[1]);
    this.heading = string.split(" ")[2];
  }

  this.directions = function(string){
    for (i = 0; i < string.length; i++) {
      if (string.charAt(i) == "L") {
        this.turnLeft();
      } else if (string.charAt(i) == "R") {
        this.turnRight();
      } else { // string.charAt(i) == "M"
        this.goStraight();
      }
    }
  };

  this.goStraight = function() {
    if (this.heading == "N") {
      this.y_position++;
    } else if (this.heading == "E") {
      this.x_position++;
    } else if (this.heading == "S") {
      this.y_position--;
    } else { // this.heading == "W"
      this.x_position--;
    }
  };

  this.turnLeft = function() {
    if (this.heading == "N") {
      this.heading = "W";
    } else if (this.heading == "E") {
      this.heading = "N";
    } else if (this.heading == "S") {
      this.heading = "E";
    } else { // this.heading == "W"
      this.heading = "S";
    }
  };

  this.turnRight = function() {
    if (this.heading == "N") {
      this.heading = "E";
    } else if (this.heading == "E") {
      this.heading = "S";
    } else if (this.heading == "S") {
      this.heading = "W";
    } else { // this.heading == "W"
      this.heading = "N";
    }
  };
  this.init(string);
}


var map = new Map("5 5");
var rover1 = new Rover("1 2 N");
var rover2 = new Rover("3 3 E");
rover1.directions("LMLMLMLMM");
rover2.directions("MMRMMRMRRM");
map.printRoverPosition(rover1);
map.printRoverPosition(rover2);
