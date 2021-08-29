// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
ujs.start()

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import '../stylesheets/application'

function func(){
document.getElementById('one1').hidden =! (document.getElementById('one1').hidden)
};

document.addEventListener("turbolinks:load", function() {
  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()
  })
})

window.addEventListener("load", () => {
  alert("page has loaded!");
});
debugger
check = document.getElementById('boxe');
check.addEventListener('change',e =>{
  func()


})