const activty_name = document.getElementById("new_activity_name");
const quieryString = window.location.search;
const urlParams = new URLSearchParams(quieryString);
const params = Object.fromEntries(urlParams.entries());

activty_name.value = params.activity

const form = document.getElementById("new_activity_form")
const activity_name = document.getElementById("new_activity_name");
const activity_items = document.getElementById("new_activity_items");
console.log(form);

form.addEventListener("submit", function (event) {
  if (activity_items.value == "" || activity_name.value == "") {
    event.preventDefault();
    console.log("no");
    return
  }
  form.submit();
})
