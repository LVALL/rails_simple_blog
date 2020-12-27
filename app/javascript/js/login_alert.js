document.addEventListener('turbolinks:load', function () {
    $('#modal_button').hide();
    if ( window.location.pathname.includes("posts")) {
        $(document).ready(function () {
            setTimeout(function () {
                document.getElementById("modal_button").click();
            }, 10000);
        });
    }
});
