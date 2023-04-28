const unorderedList = document.getElementById("ul");

unorderedList.addEventListener('change', (event) => {
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
    const itemList = document.getElementById("itemList");
    console.log(itemList);
    data.forEach(element => {
      itemList.insertAdjacentHTML("beforeend", `<li>${element}</li>`)
    })
  })
})
