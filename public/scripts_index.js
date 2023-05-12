const url = new URL("http://localhost:4567/item_request")
const unorderedList = document.getElementById("ul");

unorderedList.addEventListener('change', (event) => {
  var data = { name: event.target.name}
  Object.keys(data).forEach(key => {
    url.searchParams.append(key, data[key])
  })
  fetchList(url)
})

function fetchList(url){
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
}

activit_list = Array.from(unorderedList.childNodes).filter(nodes => nodes.tagName === 'LI');
activity_array = []
activit_list.forEach(activity => activity_array.push(activity.outerText));

console.log(activity_array);
