const activty_form = document.getElementById("new_activity")
const quieryString = window.location.search;
const urlParams = new URLSearchParams(quieryString);
const params = Object.fromEntries(urlParams.entries());

activty_form.value = params.activity
