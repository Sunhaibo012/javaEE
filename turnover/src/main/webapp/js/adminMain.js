$(document).ready(function() {
	$("#welc").css("background-color", "rgb(0 150 136)");
	$(".first").css("color", "white");

});

	function welcome() {
	$(".page1").css("display", "block");
	$(".message").css("display", "none");
	$("#char").css("background-color", "rgb(40 43 51)");
	$("#welc").css("background-color", "rgb(0 150 136)");
	$(".first").css("color", "white");
}
	function character() {
	$(".message").css("display", "block");
	$(".page1").css("display", "none");
	$("#welc").css("background-color", "rgb(40 43 51)");
	$(".second").css("color", "white");
	$("#char").css("background-color", "rgb(0 150 136)");
}

