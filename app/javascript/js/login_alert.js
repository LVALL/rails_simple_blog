document.addEventListener('turbolinks:load', function () {
    $('#modal_button').hide();
    if ( !window.location.pathname.includes("signup") && !window.location.pathname.includes("login")) {
        setTimeout(function () {
            document.getElementById("modal_button").click();
        }, 5000);
    }
});
