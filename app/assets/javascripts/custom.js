// console.log("hello console");
if (navigator.appVersion.indexOf("Android") != -1) {
    setTimeout(function () {
        $('#play-store-link').css("display", "block");
    },500)
}
else if (navigator.appVersion.indexOf("iPhone") !== -1){
}

window.onload = function(e) {
  var articleId = document
    .getElementById("content-wrapper")
    .getAttribute("value");
  if (articleId) {
    var id = localStorage.getItem("id");
    if (id == null) {
      id = " |";
    } else {
      id = id + articleId + " |";
    }

    localStorage.setItem("id", id);
    var arrayIds = localStorage.getItem("id");
    // console.log(arrayIds);
    var array = [];
    array = arrayIds.split(" |");
    // console.log(array, "array");
  }
};


var showMeaning = false;
function getMeaning() {
  // console.log(showMeaning);
  showMeaning = !showMeaning;
  // console.log("get meaning");
  if (showMeaning) document.getElementById("flipcard").classList.add("rotate");
  else document.getElementById("flipcard").classList.remove("rotate");
}
