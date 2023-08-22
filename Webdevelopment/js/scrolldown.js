/*Funktion für scrolldown oder auch scrollup (zb. von Fußnoten) unter die sticky Navigationsleiste
Die Anchor Tags die zum Sprungpunk verlinken müssen ein onlclick="scrolldown(this)" Attribut bekommen! */

function scrolldown (src) {
    if (src !== '') {
        if (typeof src !== typeof '') {
            src = $(src).attr('href');
        }
        //src ist onclick(this) also #CH1 etc.;
        window.setTimeout(function () {
            window.location.href = src;
            window.scrollBy(0, -50);
        },
        100);
    };
};
window.onload = scrolldown(window.location.hash);
