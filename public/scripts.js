// we need to set an event listener onto the ul.

const unorderedList = document.getElementById("ul");
// const xmlHttpReq = new XMLHttpRequest

unorderedList.addEventListener('change', (event) => {
  // console.log(event.target.checked);
  // console.log(event.target.name);
  // window.location.href = 'http://localhost:4567/item_request';
  var data = { name: event.target.name}
  var url = new URL("http://localhost:4567/item_request")
  Object.keys(data).forEach(key => {
    url.searchParams.append(key, data[key])
  })
  console.log(url)

  fetch(url)
  .then(response => response.json())
  .then((data) => {
    console.log(data)
  })
})
