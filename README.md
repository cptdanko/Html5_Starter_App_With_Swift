Html5 starter app with Swift
========================
This is an [Xcode] project that builds an [iOS] app such that all the [UI] for the app is powered by HTML elements that communicate with a [Swift] backend.

This project came to be when I was working on my first iOS app; [My Day Todos], which is a iOS app with UI powered by Html5. You can download My Day Todos or My Day Todos Lite(free) from the [app store] and have a look at the app or if you want to know more about it? or see how it works you can checkout the [app website].

This purpose of this repo is to serve as a starting point for anyone who wants to build a native iOS app such that the app UI is powered by HTML/Javascript/CSS. To put that into perspective, imagine having an iOS app where you create the UI using HTML components then style them with CSS and control them with a Javascript framework such as [AngularJS] and at the same time your app can be using native iOS features such as [Core Data] (amongst others). Sounds awesome right? well this starter app i.e. Xcode project template can help you achieve exactly that.

For this project at this stage the UI contents are powered by the [Ionic framework] and they are stored in the "www" directory.

# What iOS app does this project show?
When you run this project in the iOS simulator from Xcode, you will see a tab based application which will have the following tabs
- HTML content: this tab just shows the some HTML elements such as labels and icons obtained from the Ionic Framework
- iOS Notifications: this tab has HTML buttons that can schedule, print(to Xcode console) and cancel [local notifications]. To know more about this feature, you can read the post, [Local notifications in an Html5 powered iOS app(native)].
- Html5 Charts: this tab aims to demonstrate how to visualise data using an Html5 charting framework in a native iOS app....or simply put, how to draw Html5 based charts in a native iOS app. The charting library used for visualisation here is [Chartist]. I got to know about it from this excellent SitePoint article on [15 JS libraries for Creating Beautiful Charts]. I have written the blog post, [Visualising data in a native iOS app using a Html5 charting library] which provides more details on this feature of the repo.

### Today Extension(Widget) 
A Today Extension is a widget that appears in the pull down menu on iOS. This repo demonstrates how an iOS Today Extension can be powered by Html5 contents by showing a Charts widget for iOS using the charting framework ([Chartist]) used in the Html5 charts tab of this repo. The blog post [Html5 powered widget for an iOS app..] provides more details on this.

### To be added...
- Fetching data from a RESTful endpoint natively and displaying it in the WebView i.e. using [NSURLSession]

Should you have any questions on what's to be added? feel free to contact me or better yet, if you think you can add the above two things to the repo then please do and create a pull request, that would be great!

# Project goal
The objective of this repo is to provide an example of "How-to" do something, for this sort of app. If you would like to see an example on how to do something, then please let me know and I will see what I can do to include that. Also if you think you can add something to this repo, then by all means fork this repo, add your change and create a pull request.

# "This sort of app"...what do I mean?
In addition to having a background in computer science research, I am also a Java developer i.e. I work with Java web apps. So when I started working on my iOS app, I wanted to reuse my existing UI(HTML5) skillset, hence I structured my iOS app in such a way that I can reuse my UI skills. Still not clear? please have a read of my blog post ([Making an iOS app like making a Java web app]) where I try to explain it all.

# A brief history of this project
This repo was orginally called [IonicStarterAppWithSwift] and should you want to how this repo came to be i.e. the idea, motivation etc you can have a read about it in my [blog post]. A few months after creating this repo, I made a few simple, yet significant changes to this project,

# What changes?
- **A More appropriate Name**: When I first created the project I named it based on the [HTML5] framework that I was using i.e. [Ionic framework], I have since realised that this project is framework agnostic. What? what I mean is, you can pretty much use any framework to power the HTML contents for the iOS app created with this project. So the name [HTML5] starter app with Swift seemed more appropriate. I first realised that this Xcode project can be used with any HTML5 framework, when I got a [message], about how using this project helped get a rejected(iOS app store) PhoneGap app, pass the app store review process. The rejected [PhoneGap] app was actually built using [JQuery mobile] and on realising that, I was like hmmm, any HTML5 framework can be used for this, huh!
- **Reduce complexity**: Originally for this repo, I had a seperate branch to show how to schedule local notifications i.e. using [UILocalNotifications]. I realised that it was not very efficient...so this project shows a tab based app and one of the tabs provides the feature to schedule local notifications. This [post], describes the solution for how the app schedules [local notifications].

# Do you find this repo useful?
If you find this repo useful and wish to support me, you can do so by buying my app, [My Day Todos] or download the [Lite] (free) version and tell me what you think. Would love to get some feedback.

[Lite]: https://itunes.apple.com/us/app/my-day-todos-lite-todolist/id1066820078?mt=8

[Html5 powered widget for an iOS app..]: http://captaindanko.blogspot.com.au/2016/03/html5-based-widget-for-ios-app-today.html

[Visualising data in a native iOS app using a Html5 charting library]: http://captaindanko.blogspot.com.au/2015/11/visualising-data-in-native-ios-app.html

[Local notifications in an Html5 powered iOS app(native)]: http://captaindanko.blogspot.com.au/2015/02/local-notifications-in-ios7-compliant.html

[Today extension]: https://developer.apple.com/library/ios/documentation/General/Conceptual/ExtensibilityPG/NotificationCenter.html
[NSURLSession]:https://developer.apple.com/library/ios/documentation/Foundation/Reference/NSURLSession_class/
[15 JS libraries for Creating Beautiful Charts]:http://www.sitepoint.com/15-best-javascript-charting-libraries/
[Chartist]:http://gionkunz.github.io/chartist-js/
[YouTube]:https://www.youtube.com/watch?v=NATL8s3949g
[app website]: http://www.mydaytodos.com
[My Day Todos]: https://itunes.apple.com/app/my-day-todos-todolist-that/id1020072048
[app store]: https://itunes.apple.com/app/my-day-todos-todo-list-alarms/id1020072048
[Making an iOS app like making a Java web app]:http://captaindanko.blogspot.com.au/2015/06/making-ios-app-like-making-java-web-app.html
[chart]:https://en.wikipedia.org/wiki/Chart
[Core Data]: https://en.wikipedia.org/wiki/Core_Data
[AngularJS]: https://angularjs.org/
[HTML5]:https://en.wikipedia.org/wiki/HTML5
[UI]:https://en.wikipedia.org/wiki/User_interface
[JQuery mobile]:https://jquerymobile.com/
[PhoneGap]:http://phonegap.com/
[message]: http://captaindanko.blogspot.com.au/2015/01/struggling-to-fit-rejected-phonegap.html
[UILocalNotifications]:https://developer.apple.com/library/ios/documentation/iPhone/Reference/UILocalNotification_Class/
[local notifications]: https://developer.apple.com/library/ios/documentation/iPhone/Reference/UILocalNotification_Class/
[iOS]: https://en.wikipedia.org/wiki/IOS
[Swift]: https://developer.apple.com/swift/
[Xcode]: https://developer.apple.com/xcode/
[IonicStarterAppWithSwift]: https://github.com/cptdanko/IonicStarterAppWithSwift
[Ionic framework]:http://ionicframework.com/
[blog post]: http://captaindanko.blogspot.com.au/2014/10/xcode-starter-project-with-ionic-html5.html
[post]: http://captaindanko.blogspot.com.au/2015/02/local-notifications-in-ios7-compliant.html
