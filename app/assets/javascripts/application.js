// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

function headerToggle(){
 	var shrinkHeader = 25;
    var scroll = getCurrentScroll();
	var m = document.getElementById('menu');
	var h = document.getElementById('header');
    if ( scroll >= shrinkHeader ) {
		if(!h.classList.contains('shrink')){
			h.className += "shrink";
			m.className += "shrink";
        }
	} else {
		h.classList.remove("shrink");
		m.classList.remove("shrink");
    }
}

function getCurrentScroll() {
    return window.pageYOffset || document.documentElement.scrollTop;
}
