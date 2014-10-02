$(document).ready(function () {
    var menuLeft = document.getElementById('site-nav'),
        showLeftPush = document.getElementById('show-nav'),
        body = document.body;

    showLeftPush.onclick = function() {
        classie.toggle( this, 'active' );
        classie.toggle( body, 'cbp-spmenu-push-toright');
        classie.toggle( menuLeft, 'open-nav' );
        disableOther('showLeftPush');
    };

    function disableOther( button ) {
        if( button !== 'showLeftPush' ) {
            classie.toggle( showLeftPush, 'disabled' );
        }
    }


    if ($('#slides').length > 0) {
        $('#slides').slidesjs({
            width: 940,
            height: 530,
            navigation: false
        });
    }

    $("#region span").on("click", function () {
        $("#region .region-list").toggleClass("visible");
    });

    $("#region-list li a").on("click", function () {
        $("#region span").html($(this).html());

        $("#region .region-list").toggleClass("visible");
    });

});