// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree
//= require bootstrap-datepicker

//search
//$('.datepicker').datepicker();

$('#dp3').datepicker({
    format: 'mm-dd-yyyy'
});

$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({
        "format": "yyyy-mm-dd",
        "weekStart": 1,
        "autoclose": true
    });
});

//slide-show
$('.carousel').carousel({
    interval: 5000
})

//tab
$('#myTab a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
})

//subnavbar
$(document).scroll(function(){
    // If has not activated (has no attribute "data-top"
    if (!$('.subnav').attr('data-top')) {
        // If already fixed, then do nothing
        if ($('.subnav').hasClass('subnav-fixed')) return;
        // Remember top position
        var offset = $('.subnav').offset()
        $('.subnav').attr('data-top', offset.top);
    }

    if ($('.subnav').attr('data-top') - $('.subnav').outerHeight() <= $(this).scrollTop())
        $('.subnav').addClass('subnav-fixed');
    else
        $('.subnav').removeClass('subnav-fixed');
});

//combobox
$(document).ready(function(){
    $('.combobox').combobox();
});


//var startDate = new Date(2012,1,20);
//var endDate = new Date(2012,1,25);
//$('#date-start')
//    .datepicker()
//    .on('changeDate', function(ev){
//        if (ev.date.valueOf() > endDate.valueOf()){
//            $('#alert').show().find('strong').text('The start date must be before the end date.');
//        } else {
//            $('#alert').hide();
//            startDate = new Date(ev.date);
//            $('#date-start-display').text($('#date-start').data('date'));
//        }
//        $('#date-start').datepicker('hide');
//    });
//$('#date-end')
//    .datepicker()
//    .on('changeDate', function(ev){
//        if (ev.date.valueOf() < startDate.valueOf()){
//            $('#alert').show().find('strong').text('The end date must be after the start date.');
//        } else {
//            $('#alert').hide();
//            endDate = new Date(ev.date);
//            $('#date-end-display').text($('#date-end').data('date'));
//        }
//        $('#date-end').datepicker('hide');
//    });
//});


$('.dropdown-menu form').on('click.dropdown.data-api', function(e){
    e.stopPropagation();
});
