// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


import $ from 'jquery'
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'select2'
import 'select2/dist/css/select2.css'
require("jquery")

require("packs/employees")
require('packs/index')
require('packs/newmember')

Rails.start()
Turbolinks.start()
ActiveStorage.start()


import '../stylesheets/application'



$(document).ready(function() {
  $('#membership_user_role').select2({
    placeholder: 'Select an option',
    tags: true,
    minimumInputLength: 3,
    maximumInputLength: 29,
    width: '100%',
    ajax: {
      url: '/members/new',
      type: "GET", 
      dataType: "json",
      data: function (params) {
        var query = {
        search: params.term,
        type: 'public'
        }
        // Query parameters will be ?search=[term]&type=public
        return query;
      },
      processResults: function (data) {
        return {
         results: data.items
        };
      } 
    }                           
  });
});
