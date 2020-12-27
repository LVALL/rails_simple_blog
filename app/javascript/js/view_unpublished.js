document.addEventListener('turbolinks:load', function () {
    if ( window.location.pathname.includes("posts")) {
        $(document).ready(function() {
            $('.unpublished').hide();
            $('input[type="checkbox"]').click(function() {
                let inputValue = $(this).attr("value");
                $("." + inputValue).toggle();
            });
        });
    }
});