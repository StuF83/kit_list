const url = new URL("http://localhost:4567/item_request")
const destroyUrl = new URL("http://localhost:4567/destroy_activities")
const userActivites = document.getElementById("ul");

userActivites.addEventListener('change', (event) => {
  var data = { name: event.target.name}
  var url = new URL("http://localhost:4567/item_request")

  Object.keys(data).forEach(key => {
    url.searchParams.append(key, data[key]);
    console.log(url.searchParams);
  })
  if (itemisedListButton.classList.contains("button-pressed")) {
    fetchListToItems(url);
  } else {
    fetchListToActivities(url);
  }
})


const itemisedListButton = document.getElementById("itemised-list-button");
const activityListButton = document.getElementById("activity-list-button");

itemisedListButton.addEventListener('click', () => {
  activityListButton.classList.remove("button-pressed");
  itemisedListButton.classList.add("button-pressed");
  fetchListToItems(url);
});

activityListButton.addEventListener('click', function() {
  itemisedListButton.classList.remove("button-pressed");
  activityListButton.classList.add("button-pressed");
  fetchListToActivities(url);
});

function fetchListToItems(url){
  fetch(url)
  .then(response => response.json())
  .then((data) => {
    depopulateList();
    populateItemList(data);
  })
}

function fetchListToActivities(url){
  fetch(url)
  .then(response => response.json())
  .then((data) => {
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
    for (const value of data[key]) {
      itemsSet.add(value);
    }
  }
  let sortedSet = Array.from(itemsSet).sort();
  sortedSet.forEach(value => {
    itemList.insertAdjacentHTML("beforeend", `<li>${value}</li>`)
  })
}

function populateActivityList(data) {
  for (const key in data) {
    itemList.insertAdjacentHTML("beforeend", `<li>${key}</li>`);
    let activityName = itemList.lastChild;
    activityName.classList.add("item-list-activity-name");
    for (const value of data[key]) {
      itemList.insertAdjacentHTML("beforeend", `<li>${value}</li>`);
    }
  }
}

const deleteActivityButton = document.getElementById("delete-activity");

deleteActivityButton.addEventListener('click', (event) => {
  activities = Array.from(userActivites.childNodes).filter(nodes => nodes.tagName === 'LI')
  checkedActivities = []
  checkedElements = []
  activities.forEach(element => {
    if (element.childNodes[1].checked === true) {
      checkedActivities.push(element)
      checkedElements.push(element.outerText)
    }
  })
  console.log(checkedElements);
  activitiesToDelete = {}
  checkedElements.forEach((element, index) => {
    activitiesToDelete[`key${index}`] = element
    console.log(activitiesToDelete);
    index += 1;
  })

  fetch(destroyUrl, {
    method: "POST",
    headers: {'Content-Type': 'application/json'},
    body: JSON.stringify(activitiesToDelete)
  })
  .then(response => {
    if (response.ok) {
      console.log(response);
      if (itemisedListButton.classList.contains("button-pressed")) {
        fetchListToItems(url);
      } else {
        fetchListToActivities(url);
      }
      checkedActivities.forEach(element => {
        element.remove();
      })
    }
    else {
      console.log("not ok");
    }
  })
});



activityList = Array.from(userActivites.childNodes).filter(nodes => nodes.tagName === 'LI');
activityArray = [];
activityList.forEach(activity => activityArray.push(activity.outerText));

console.log(activityArray);
