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
//= require bootstrap-combobox
//= require bootstrap-scrollspy
//= require_tree
//= require ckeditor/init
//= require bootstrap-datepicker
//= require mybootstrap

//$('#dp3').datepicker({
//    format: 'mm-dd-yyyy'
//});

//handle ckeditor
$(document).ready(function(){
    if (CKEDITOR.instances['tourism_article_content']) {
        CKEDITOR.remove(CKEDITOR.instances['tourism_article_content']);
    }
    if ($('#tourism_article_content').length) CKEDITOR.replace('tourism_article_content', {
        "language":"id",
        "toolbar":"Full",
        "class":["ckeditor","required"]
    });
});

$(document).ready(function(){
    if (CKEDITOR.instances['folktale_description']) {
        CKEDITOR.remove(CKEDITOR.instances['folktale_description']);
    }
    if ($('#folktale_description').length) CKEDITOR.replace('folktale_description', {
        "language":"id",
        "toolbar":"Full",
        "class":["ckeditor","required"]
    });
});

$(document).ready(function(){
    if (CKEDITOR.instances['event_description']) {
        CKEDITOR.remove(CKEDITOR.instances['event_description']);
    }
    if ($('#event_description').length) CKEDITOR.replace('event_description', {
        "language":"id",
        "toolbar":"Full",
        "class":["ckeditor","required"]
    });
});

$(document).ready(function(){
    if (CKEDITOR.instances['tourism_location_description']) {
        CKEDITOR.remove(CKEDITOR.instances['tourism_location_description']);
    }
    if ($('#tourism_location_description').length) CKEDITOR.replace('tourism_location_description', {
        "language":"id",
        "toolbar":"Full",
        "class":["ckeditor","optional"]
    });
});

$(document).ready(function(){
    if (CKEDITOR.instances['tips_trick_description']) {
        CKEDITOR.remove(CKEDITOR.instances['tips_trick_description']);
    }
    if ($('#tips_trick_description').length) CKEDITOR.replace('tips_trick_description', {
        "language":"id",
        "toolbar":"Full",
        "class":["ckeditor","required"]
        });
});
    
//date
$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({
        //        "format": "dd-mm-yyyy",
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
//$(document).scroll(function(){
//    // If has not activated (has no attribute "data-top"
//    if (!$('.subnav').attr('data-top')) {
//        // If already fixed, then do nothing
//        if ($('.subnav').hasClass('subnav-fixed')) return;
//        // Remember top position
//        var offset = $('.subnav').offset()
//        if(offset) $('.subnav').attr('data-top', offset.top);
//    }
//
//    if ($('.subnav').attr('data-top') - $('.subnav').outerHeight() <= $(this).scrollTop())
//        $('.subnav').addClass('subnav-fixed');
//    else
//        $('.subnav').removeClass('subnav-fixed');
//});

//combobox
$(document).ready(function(){
    $('.combobox').combobox();
});

$('.dropdown-menu form').on('click.dropdown.data-api', function(e){
    e.stopPropagation();
});

$(document).on('shown', '.modal', function(){
    $(':input:visible:enabled:not(:button):first', this).focus();
}).on('ajax:before', '#form-sign-in, #form-sign-up', function(){
    $(':submit.btn-primary', this).attr('disabled', true);
}).on('ajax:complete', '#form-sign-in, #form-sign-up', function(){
    $(':submit.btn-primary', this).attr('disabled', false);
});
