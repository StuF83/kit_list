const unorderedList = document.getElementById("ul");
const cookies = document.cookie;
console.log(cookies);

unorderedList.addEventListener('change', (event) => {
  var data = { name: event.target.name}
  console.log(data);
  console.log("event listener");
  console.log(event.target.checked);
  console.log(cookies);
  var url = new URL("http://localhost:4567/item_request")
  Object.keys(data).forEach(key => {
    url.searchParams.append(key, data[key])
  })

  fetch(url)
  .then(response => response.json())
  .then((data) => {
    console.log(data);
    const itemList = document.getElementById("itemList");
    while (itemList.hasChildNodes()) {
      itemList.removeChild(itemList.firstChild);
    }
    data.forEach(activity => {
      activity.forEach(element =>{
        itemList.insertAdjacentHTML("beforeend", `<li>${element}</li>`)
      })
    })
  })
})
