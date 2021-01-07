document.addEventListener('turbolinks:load', function () {
    Turbolinks.scroll = {};

    document.addEventListener("turbolinks:load", ()=> {

        const elements = document.querySelectorAll("[data-turbolinks-scroll]");

        elements.forEach(function(element){

            element.addEventListener("click", ()=> {
                Turbolinks.scroll['top'] = document.window.scrollTop;
            });

            element.addEventListener("submit", ()=> {
                Turbolinks.scroll['top'] = document.window.scrollTop;
            });

        });

        if (Turbolinks.scroll['top']) {
            document.window.scrollTo(0, Turbolinks.scroll['top']);
        }

        Turbolinks.scroll = {};
    });
});
