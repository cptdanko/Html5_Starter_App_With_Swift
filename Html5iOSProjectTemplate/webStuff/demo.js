function callSwiftWithJSON() {
    var json = {
        "name": "Bhuman",
        "role": "Founder",
    };
    //remember Swift call is the metho
    webkit.messageHandlers.swiftCall.postMessage(json);
}
/*
 method to show sharing content
 */
function shareContent() {
    var task = {
        "task": "Call mum & dad",
        "time": "6:00PM"
    };
    webkit.messageHandlers.shareFromHTML.postMessage(task);
}
/*
 A simple method to trigger a title udpate from Swift
 */
function updateTitle() {
    document.querySelector('h1').innerHTML = "Welcome to Javascript from Swift";
}
/*
 In this method the goal is to receive some data from the Swift
 backend i.e. a Swift function will pass some data here
 */
function updateWeather(data) {
    //to be implemented
}
/*
 A function to fetch some data using a Xhttp request and send it back
 to the Swift backend.
 
 */
function makeXhttpRequest() {
    var quizUrl = "https://opentdb.com/api.php?amount=5";
    var xhr = new XMLHttpRequest();
    xhr.open("GET", quizUrl, true);
    xhr.onload = function (e) {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
            //console.log(xhr.responseText);
            webkit.messageHandlers.quizDataFromAPI.postMessage(xhr.responseText);
            console.log("sent the messsge to the backend");
        } else {
          console.error(xhr.statusText);
        }
      }
    };
    xhr.onerror = function (e) {
      console.error(xhr.statusText);
    };
    xhr.send(null);
    
}
