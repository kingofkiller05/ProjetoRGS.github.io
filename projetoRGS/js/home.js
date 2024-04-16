const menu = document.querySelector('.menu');
const NavMenu = document.querySelector('.nav-menu');

menu.addEventListener('click', () => {
    menu.classList.toggle('ativo');
    NavMenu.classList.toggle('ativo');
})

var typed = new Typed(".Textos", {
    strings: ["Olhe os memes.", "Primeiro Time de RGS.", "Nosso Uniforme"],
    typeSeed: 100,
    backSeed: 100,
    backDeplay: 1000,
    loop: true})