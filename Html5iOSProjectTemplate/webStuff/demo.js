
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
