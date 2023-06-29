const url = new URL("http://localhost:4567/item_request")
const unorderedList = document.getElementById("ul");

unorderedList.addEventListener('change', (event) => {
  var data = { name: event.target.name}
  console.log(data);
  console.log("event listener");
  console.log(event.target.checked);
  var url = new URL("http://localhost:4567/item_request")

  Object.keys(data).forEach(key => {
    url.searchParams.append(key, data[key])
  })
  fetchListToActivities(url)
})


const itemisedListButton = document.getElementById("itemised-list-button");
const activityListButton = document.getElementById("activity-list-button");

itemisedListButton.addEventListener('click', () => {
  fetchListToItems(url)
});

activityListButton.addEventListener('click', function() {
  fetchListToActivities(url)
});

function fetchListToItems(url){
  fetch(url)
  .then(response => response.json())
  .then((data) => {
    console.log(data);
    depopulateList();
    populateItemList(data);
  })
}

function fetchListToActivities(url){
  fetch(url)
  .then(response => response.json())
  .then((data) => {
    console.log(data);
    depopulateList();
    populateActivityList(data);
  })
}

function depopulateList() {
  const itemList = document.getElementById("itemList");
  while (itemList.hasChildNodes()) {
    itemList.removeChild(itemList.firstChild);
  }
}

function populateItemList(data) {
  const itemsSet = new Set()
  for (const key in data) {
    console.log(key);
    for (const value of data[key]) {
      itemsSet.add(value);
    }
  }
  console.log(itemsSet);
  itemsSet.forEach(value => {
    itemList.insertAdjacentHTML("beforeend", `<li>${value}</li>`)
  })
}


function populateActivityList(data) {
  for (const key in data) {
    itemList.insertAdjacentHTML("beforeend", `<li>${key}</li>`);
    let activityName = itemList.lastChild;
    console.log(activityName);
    activityName.classList.add("item-list-activity-name");
    for (const value of data[key]) {
      itemList.insertAdjacentHTML("beforeend", `<li>${value}</li>`);
    }
  }
}


activit_list = Array.from(unorderedList.childNodes).filter(nodes => nodes.tagName === 'LI');
activity_array = []
activit_list.forEach(activity => activity_array.push(activity.outerText));

console.log(activity_array);
