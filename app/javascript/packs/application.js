/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// See: https://github.com/patternfly/patternfly/blob/master/QUICKSTART.md#using-patternfly-in-your-application
//
import 'bootstrap/dist/js/bootstrap'; // Bootstrap JS
import 'moment/moment'; // Bootstrap Date Time Picker - requires Moment
import 'bootstrap-datepicker/dist/js/bootstrap-datepicker'; // Bootstrap Date Picker

const ready = () => {
  $('.bootstrap-datepicker').datepicker({
    autoclose: true,
    todayBtn: "linked",
    todayHighlight: true
  });
}

$(document).on('turbolinks:load', ready)

