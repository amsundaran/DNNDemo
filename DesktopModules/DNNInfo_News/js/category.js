$(document).ready(function() {
    $('.DNNInfo_CategoryList ul li').click(function(ev) {
        if (!$(ev.target).is('a')) {
            if (!$(this).find('> ul').is(':visible')) {
                $(this).find('> ul').show();
                //$(this).find('> ul').slideDown('slow');
                $(this).find('> span.DNNInfo_Arrow').addClass('DNNInfo_ArrowCollapse');
                $(this).find('> span.DNNInfo_ArrowCollapse').removeClass('DNNInfo_Arrow');
            } else {
                $(this).find('> ul').hide();
                //$(this).find('> ul').slideUp('slow');
                $(this).find('> span.DNNInfo_ArrowCollapse').addClass('DNNInfo_Arrow');
                $(this).find('> span.DNNInfo_Arrow').removeClass('DNNInfo_ArrowCollapse');
            }
            return false;
        }
    });
});