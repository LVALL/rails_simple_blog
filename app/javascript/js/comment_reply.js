document.addEventListener('turbolinks:load', function () {
    if ( window.location.pathname.includes("posts")) {
        $(document).ready(function() {
            $('.comment_reply_form').hide();
            $('.reply_button').click(function() {
              $(this).closest('.comment_card').children('.comment_reply_form').show(500);
            });
        });
    }
});
