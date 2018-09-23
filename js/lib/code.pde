var lx1 = 0;
var ly = 340;
var lx2 = 250;
var bxsize = 100;
var  recty;
var rectx;
var drawPuzzle ;
var boxsize;
var health;
var l11;
var l33;
var l44;
var ly1;
var checkMoves;
var ly2;
var ly3;
var lost=false;
var won = false;

//variables
recty = 349;
rectx = 175;
health = 100;
boxsize = 50; 
l11 = 225;
l33 = 209;
l44 = 200;
ly1 = 150;
ly2 = 209;
ly3 = 270;

setup = function() {
  size(400, 400);
};


//*The  square  that  is  going  to  move
draw = function() {
    background(0, 108, 209);
    rect(rectx,recty,boxsize,boxsize);
    fill(153, 186, 88);
    drawPuzzle();
     checkMoves();
     if(lost===true){
        text("YOU LOSE",70,50,950,700); 
     }
     if(won===true){
        text("YOU WIN",70,50,950,700); 
     }
textSize(60);
var f = createFont("serif");
textFont(f);
};

drawPuzzle = function(){
    line(1,150,l11,150);
    line(l11 +bxsize,150,400,150);
    line(1,ly2,l33,ly2);
    line(l33+bxsize,209,400,209);
    line(1,270,l44,270);
    line(l44 + bxsize,270,400,270);
    //line(1,340,270,340);
    //line(320,340,400,340);
     line(lx1,ly,lx2,ly);
     line(lx2 + bxsize,ly,400,ly);
     if(lost!==true && won!==true) {
         lx2 = lx2+1;
         l11 = l11+2;
         l33 = l33+1.7;
         l44 = l44+1.5;
    
         if(lx2>=400){
             lx2 = 0;
         }
         if(l11>=400){
             l11 = 0;
         }
         if(l33>=400){
             l33 = 0;
         }
         if(l44>=400){
             l44 = 0;
         }
    
     }
};

void keyPressed(){
	console.log("keyPressed:" + keyCode);
    var moveSteps = 15;
    if(keyCode === 39){
        rectx +=moveSteps;
    }
    if(keyCode === 37){
        rectx -=moveSteps;
    }
    if(keyCode === 40){
        recty += moveSteps;
    }
    if(keyCode === 38){
        recty -=moveSteps;
    }
};

checkMoves = function(){
    var rectx1 = rectx + boxsize;
    var recty1 = recty + boxsize;
    var lx2s = lx2 + bxsize;
    if(ly>recty && ly <recty1){
        if((lx2 > rectx && (lx2 < rectx1)) || 
            (lx2s < rectx1) && lx2s > rectx) {
            lost = true;
        }
    }
  
    var l33s = l33 + bxsize;
    if(ly2>recty && ly2 <recty1){
        if((l33 > rectx && (l33 < rectx1)) || 
            (l33s < rectx1) && l33s > rectx) {
            lost = true;
        }
    }

    var l44s = l44 + bxsize;
    if(ly3>recty && ly3 <recty1){
        if((l44 > rectx && (l44 < rectx1)) || 
            (l44s < rectx1) && l44s > rectx) {
            lost = true;
        }
    }
   var l11s = l11 + bxsize;
    if(ly1>recty && ly1 <recty1){
        if((l11 > rectx && (l11 < rectx1)) || 
            (l11s < rectx1) && l11s > rectx) {
            lost = true;
        }
    }
    if(recty1<ly1){
        won = true;
    }
    
};  
