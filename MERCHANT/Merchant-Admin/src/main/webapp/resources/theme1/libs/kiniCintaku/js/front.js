
$(function () {

 
    utils();

});


function box(i) {

	var radio = $('input[id=blankRadio'+i+']');
	radio.prop("checked",true);
	console.log(radio);
}

function utils() {

    /* tooltips */

    $('[data-toggle="tooltip"]').tooltip();

    /* click on the box activates the radio */
	 $('.kalkulator').on('click', function (e) {
	var radio = $(this).find(':radio');
	radio.prop('checked', true);
	$('.kalkulator').removeClass('kalkulatoractive');
	 $(this).addClass('kalkulatoractive');
    }); 

    $('.box.clickable').on('click', function (e) {

	window.location = $(this).find('a').attr('href');
    });
    /* external links in new window*/

    $('.external').on('click', function (e) {

	e.preventDefault();
	window.open($(this).attr("href"));
    });
    /* animated scrolling */

    $('.scroll-to, .scroll-to-top').click(function (event) {

	var full_url = this.href;
	var parts = full_url.split("#");
	if (parts.length > 1) {

	    scrollTo(full_url);
	    event.preventDefault();
	}
    });
    function scrollTo(full_url) {
	var parts = full_url.split("#");
	var trgt = parts[1];
	var target_offset = $("#" + trgt).offset();
	var target_top = target_offset.top - 100;
	if (target_top < 0) {
	    target_top = 0;
	}

	$('html, body').animate({
	    scrollTop: target_top
	}, 1000);
    }
}


