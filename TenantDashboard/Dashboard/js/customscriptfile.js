$(document).ready(function () {
    $(".sideMenuToggler").on("click", function () {
        $(".wrapper").toggleClass("active");
    });
});


/* // ***********Nav Tabs Switching to work proplorly************ */

$("ul.nav.nav-pills li.nav-item a").click(function () {
    $("ul.nav.nav-pills li.nav-item a.active").removeClass('active');
    $(this).addClass('active');
});




/* // *****************tooltip Initiating**************** */

$(function () {
    $('[data-toggle="tooltip"]').tooltip()
})
