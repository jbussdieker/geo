// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function locationUpdate(position) {
  document.getElementById("lng").value = position.coords.longitude;
  document.getElementById("lat").value = position.coords.latitude;
  document.getElementById("status").innerHTML = position.coords.accuracy;
}

function locationError(error) {
  document.getElementById("status").innerHTML = "Error getting location";
}

// Request repeated updates.
var watchId = navigator.geolocation.watchPosition(locationUpdate, locationError);

function buttonClickHandler() {
  // Cancel the updates when the user clicks a button.
  navigator.geolocation.clearWatch(watchId);
  console.log("Boom3!");
}

