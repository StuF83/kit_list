// we need to set an event listener onto the ul.

const unorderedList = document.getElementById("ul");
// const xmlHttpReq = new XMLHttpRequest

unorderedList.addEventListener('change', (event) => {
  // console.log(event.target.checked);
  // console.log(event.target.name);
  // window.location.href = 'http://localhost:4567/item_request';
  var data = { NAME: event.target.name}
  var url = new URL("http://localhost:4567/item_request")
  // console.log(data);
  // console.log(url.searchParams)
  Object.keys(data).forEach(key => {
    console.log(key);
    console.log(data[key]);
  })



  // fetch("http://localhost:4567/item_request")
  // .then(response => response.json())
  // .then((data) => {
  //   console.log(data)
  // })
})
