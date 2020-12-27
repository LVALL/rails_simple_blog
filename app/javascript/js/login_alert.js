document.addEventListener('turbolinks:load', function () {
    $(document).ready(function() {
        $('#modal_button').hide();
        setTimeout(function () {
            document.getElementById("modal_button").click();
        }, 3000);
    });
});
