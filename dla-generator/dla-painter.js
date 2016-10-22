//Nick Hale njohnhale@gmail.com

var canvasWidth = 500;
var canvasHeight = 500;
var canvas;
var context;

// flag for painting
var paint = false;

$( document ).ready( function() {
	// get the canvas div
	var canvasDiv = $('#canvasDiv');
	// instantiate the canvas 
	canvas = document.createElement('canvas');
	canvas.setAttribute('width', canvasWidth);
	canvas.setAttribute('height', canvasHeight);
	canvas.setAttribute('id', 'canvas');
	// append canvas to canvas div
	canvasDiv.append(canvas);
	// check if the canvas manager is defined
	if (typeof G_vmlCanvasManager != 'undefined')// if it is, set the canvas
		canvas = G_vmlCanvasManager.initElement(canvas);
	// set the canvas context
	context = canvas.getContext('2d');
});

// Define the canvas' mousedown behavior
$('#canvas').mousedown(function(e) {
	// get the mouse location in the canvas
	var mouseX = e.pageX - this.offsetLeft;
	var mouseY = e.pageX - this.offsetTop;

	//set the paint flag
	paint = true;
	addClick(mouseX, mouseY);
	redraw();
});

// Define the canvas' mousemove behavior
$('#canvas').mousemove(function(e) {
	if (paint) {
		addClick(e.pageX - this.offsetLeft, e.pageY - this.offsetY, true);
		redraw();
	}
});


// Defines how the canvas is redrawn 
function redraw() {
	context.clearRect(0, 0, context.convas.width, context.canvas.height);

	context.strokeStyle = '#df4b26';
	context.lineJoin = 'round';
	context.lineWidth = 5;

	for (var i = 0; i < clickX.length; i++) {
		context.beginPath();
		if (clickDrag[i] && i) {
			context.moveTo(clickX[i - 1], clickY[i - 1]);
		}
		// insert rest of logic here
	}

}
