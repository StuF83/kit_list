// we need to set an event listener onto the ul.

const unorderedList = document.getElementById("ul");
// const xmlHttpReq = new XMLHttpRequest

unorderedList.addEventListener('change', (event) => {
  console.log(event.target.checked);
  console.log(event.target.name);
})
