# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Category.create([{name: 'Mobile Development'}, {name: 'Web Design'}, {name: 'Photo'}, {name: 'Web Development'}])

description = "Android is the most popular OS in the world. There are millions of devices accessing tens of thousands of applications. It is many people's entry point into the world of technology; it is an operating system for everyone. Despite this, the entry-fee to actually make Android applications is usually a computer science degree, or five years’ worth of Java experience.
Android Programming for Beginners will be your companion to create Android applications from scratch—whether you’re looking to start your programming career, make an application for work, be reintroduced to mobile development, or are just looking to program for fun. We will introduce you to all the fundamental concepts of programming in an Android context, from the Java basics to working with the Android API. All examples are created from within Android Studio, the official Android development environment that helps supercharge your application development process.
After this crash-course, we’ll dive deeper into Android programming and you’ll learn how to create applications with a professional-standard UI through fragments, make location-aware apps with Google Maps integration, and store your user’s data with SQLite. In addition, you’ll see how to make your apps multilingual, capture images from a device’s camera, and work with graphics, sound, and animations too.
By the end of this book, you’ll be ready to start building your own custom applications in Android and Java."
book = Book.new(title: 'Android Programming for Beginners',
            publication_year: 2015, price: 35.99, description: description,
            height: 6.4, width: 0.9, depth: 5.0)
book.authors << [Author.find_or_create_by(name: 'John Horton')]
book.categories << [Category.find_by(name: 'Mobile Development')]
# book.image_urls << [ImageUrl.create(url: 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg')]
book.cover_url = 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg'
book.save!

description = 'Packed with trade secrets, this second edition is your one-stop solution to creating websites that will provide the best experience for your users. We cover six popular, real-world examples, where each project teaches you about the various functionalities of Bootstrap 4 and their implementation.
The book starts off by getting you up and running with the new features of Bootstrap 4 before gradually moving on to customizing your blog with Bootstrap and SASS, building a portfolio site, and turning it into a WordPress theme. In the process, you will learn to recompile Bootstrap files using SASS, design a user interface, and integrate JavaScript plugins. Towards the end of the book, you will also be introduced to integrating Bootstrap 4 with popular application frameworks such as Angular 2, Ruby on Rails, and React.'
book = Book.new(title: 'Bootstrap 4 Site Blueprints',
            publication_year: 2016, price: 34.99, description: description,
            height: 6.4, width: 1.0, depth: 4.6)
book.authors << [Author.find_or_create_by(name: 'Bass Jobsen'),
                 Author.find_or_create_by(name: 'David Cochran'),
                 Author.find_or_create_by(name: 'Ian Whitley')]
book.categories << [Category.find_by(name: 'Web Design'), Category.find_by(name: 'Web Development')]
# book.image_urls << [ImageUrl.create(url: 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg')]
book.cover_url = 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg'
book.save!

description = 'Node.js is the most popular framework to create server-side applications today. Be it web, desktop, or mobile, Node.js comes to your rescue to create stunning real-time applications. Node.js 6.x Blueprints will teach you to build these types of projects in an easy-to-understand manner.
The key to any Node.js project is a strong foundation on the concepts that will be a part of every project. The book will first teach you the MVC design pattern while developing a Twitter-like application using Express.js. In the next chapters, you will learn to create a website and applications such as streaming, photography, and a store locator using MongoDB, MySQL, and Firebase.
Once you’re warmed up, we’ll move on to more complex projects such as a consumer feedback app, a real-time chat app, and a blog using Node.js with frameworks such as loopback.io and socket.io. Finally, we’ll explore front-end build processes, Docker, and continuous delivery.
By the end of book, you will be comfortable working with Node.js applications and will know the best tools and frameworks to build highly scalable desktop and cloud applications.'
book = Book.new(title: 'Node.js 6.x Blueprints',
                publication_year: 2016, price: 34.99, description: description,
                height: 6.4, width: 1.0, depth: 4.6)
book.authors << [Author.find_or_create_by(name: 'Fernando Monteiro')]
book.categories << [Category.find_by(name: 'Web Design'), Category.find_by(name: 'Web Development')]
# book.image_urls << [ImageUrl.create(url: 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg')]
book.cover_url = 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg'
book.save!

description = "Laravel is a prominent member of a new generation of web frameworks. It is one of the most popular PHP frameworks and is also free and an open source. Laravel 5 is a substantial upgrade with a lot of new toys, at the same time retaining the features that made Laravel wildly successful. It comes with plenty of architectural as well as design-based changes.
The book is a blend of numerous recipes that will give you all the necessary tips you need to build an application. It starts with basic installation and configuration tasks and will get you up-and-running in no time. You will learn to create and customize your PHP app and tweak and re-design your existing apps for better performance. You will learn to implement practical recipes to utilize Laravel's modular structure, the latest method injection, route caching, and interfacing techniques to create responsive modern-day PHP apps that stand on their own against other apps. Efficient testing and deploying techniques will make you more confident with your Laravel skills as you move ahead with this book.
Towards the end of the book, you will understand a number of add-ons and new features essential to finalize your application to make it ready for subscriptions. You will be empowered to get your application out to the world."
book = Book.new(title: 'Laravel 5.x Cookbook',
                publication_year: 2016, price: 34.99, description: description,
                height: 6.4, width: 1.0, depth: 4.6)
book.authors << [Author.find_or_create_by(name: 'Alfred Nutile')]
book.categories << [Category.find_by(name: 'Web Design'), Category.find_by(name: 'Web Development')]
# book.image_urls << [ImageUrl.create(url: 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg')]
book.cover_url = 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg'
book.save!

description = "Responsive web design (RWD) is a web design approach aimed at crafting sites to provide an optimal viewing and interaction experience—providing easy reading and navigation with minimum resizing, panning, and scrolling—and all of this across a wide range of devices from desktop computer monitors to mobile phones. Responsive web design is becoming more important as the amount of mobile traffic now accounts for more than half of the Internet’s total traffic.
This book will give you in depth knowledge about the basics of responsive web design. You will embark on a journey of building effective responsive web pages that work across a range of devices, from mobile phones to smart TVs, with nothing more than standard markup and styling techniques.
You'll begin by getting an understanding of what RWD is and its significance to the modern web. Building on the basics, you'll learn about layouts and media queries. Following this, we’ll dive into creating layouts using grid based templates. We’ll also cover the important topic of performance management, and discover how to tackle cross-browser challenges."
book = Book.new(title: 'Responsive Web Design with HTML5 and CSS3 Essentials',
                publication_year: 2016, price: 19.99, description: description,
                height: 6.4, width: 0.9, depth: 5.0)
book.authors << [Author.find_or_create_by(name: 'Gaurav Gupta'),
                 Author.find_or_create_by(name: 'Alex Libby'),
                 Author.find_or_create_by(name: 'Asoj Talesra')]
book.categories << [Category.find_by(name: 'Web Design'), Category.find_by(name: 'Web Development')]
# book.image_urls << [ImageUrl.create(url: 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg')]
book.cover_url = 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg'
book.save!

description = 'React has taken the web development world by storm, and it is only natural that the unique architecture and its ecosystem of third-party support be applied to native application development. This book will take you through the basics of React Native development all the way through to some more advanced components.
This book covers topics in React Native ranging from adding basic UI components to successfully deploying for multiple target platforms. The book follows a top-down approach beginning with building rich user interfaces. These UIs will be created with both built-in and custom components that you will create, style, and animate.
You will then learn about different strategies for working with data, including leveraging the popular Redux library and optimizing the performance of the application. Then, you will step further into exposing native device functionality. Finally, we will discuss how to put your application into production and maintain its reliability.'
book = Book.new(title: 'React Native Cookbook',
                publication_year: 2016, price: 34.99, description: description,
                height: 6.4, width: 0.9, depth: 5.0)
book.authors << [Author.find_or_create_by(name: 'Crysfel Villa'),
                 Author.find_or_create_by(name: 'Stan Bershadskiy')]
book.categories << [Category.find_by(name: 'Web Design'), Category.find_by(name: 'Web Development')]
# book.image_urls << [ImageUrl.create(url: 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg')]
book.cover_url = 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg'
book.save!

description = 'Vue.js is an open source JavaScript library for building modern, interactive web applications. With a rapidly growing community and a strong ecosystem, Vue.js makes developing complex single page applications a breeze. Its component-based approach, intuitive API, blazing fast core, and compact size make Vue.js a great solution to craft your next front-end application.
From basic to advanced recipes, this book arms you with practical solutions to common tasks when building an application using Vue. We start off by exploring the fundamentals of Vue.js: its reactivity system, data-binding syntax, and component-based architecture through practical examples.
After that, we delve into integrating Webpack and Babel to enhance your development workflow using single file components. Finally, we take an in-depth look at Vuex for state management and Vue Router to route in your single page applications, and integrate a variety of technologies ranging from Node.js to Electron, and Socket.io to Firebase and HorizonDB.
This book will provide you with the best practices as determined by the Vue.js community.'
book = Book.new(title: 'Vue.js 2 Cookbook',
                publication_year: 2017, price: 34.99, description: description,
                height: 6.4, width: 0.9, depth: 5.0)
book.authors << [Author.find_or_create_by(name: 'Andrea Passaglia')]
book.categories << [Category.find_by(name: 'Web Design'), Category.find_by(name: 'Web Development')]
# book.image_urls << [ImageUrl.create(url: 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg')]
book.cover_url = 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg'
book.save!

description = 'Angular 2 will help you build faster, more efficient, and more flexible cross-platform applications. Angular 2 is known for taking the pain out of JavaScript development, and enabling more organized, readable, and testable code.
This book builds three apps with varying degrees of complexity. It starts with a simple ‘Guess the Number’ game, which serves as a platform to launch you into the world of Angular. Next, you will learn to construct a popular ‘7-Minute Workout’ app, covering the building blocks of Angular. The final app, ‘Personal Trainer’ morphs the existing ‘7-Minute Workout’ into a full-fledged personal workout builder and runner, covering advanced directive building, which is the most fundamental and powerful feature of Angular.
In addition to this, you will learn about testability and the framework constructs Angular provides to effectively test your app. The book concludes by providing you with practical advice and useful tips that will come in handy as you build more and more apps with Angular.'
book = Book.new(title: 'Angular 2 By Example',
                publication_year: 2016, price: 31.99, description: description,
                height: 6.4, width: 0.9, depth: 5.0)
book.authors << [Author.find_or_create_by(name: 'Chandermani Arora'),
                 Author.find_or_create_by(name: 'Kevin Hennessy')]
book.categories << [Category.find_by(name: 'Web Design'), Category.find_by(name: 'Web Development')]
# book.image_urls << [ImageUrl.create(url: 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg')]
book.cover_url = 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg'
book.save!

description = "If you are a web developer and want to create web applications that look good, are efficient, have rich user interfaces, and integrate seamlessly with any backend using AJAX, then this book is the ideal match for you. We’ll show you how you can integrate jQuery 3.0 into your web pages, avoid complex JavaScript code, create brilliant animation effects for your web applications, and create a flawless app.
We start by configuring and customising the jQuery environment, and getting hands-on with DOM manipulation. Next, we’ll explore event handling advanced animations, creating optimised user interfaces, and building useful third-party plugins. Also, we'll learn how to integrate jQuery with your favourite back-end framework.
Moving on, we’ll learn how the ECMAScript 6 features affect your web development process with jQuery. we’ll discover how to use the newly introduced JavaScript promises and the new animation API in jQuery 3.0 in great detail, along with sample code and examples.
By the end of the book, you will be able to successfully create a fully featured and efficient single page web application and leverage all the new features of jQuery 3.0 effectively."
book = Book.new(title: 'Learning jQuery 3 - Fifth Edition',
                publication_year: 2017, price: 30.99, description: description,
                height: 6.4, width: 0.9, depth: 5.0)
book.authors << [Author.find_or_create_by(name: 'Adam Boduch'),
                 Author.find_or_create_by(name: 'Jonathan Chaffer'),
                 Author.find_or_create_by(name: 'Karl Swedberg')]
book.categories << [Category.find_by(name: 'Web Design'), Category.find_by(name: 'Web Development')]
# book.image_urls << [ImageUrl.create(url: 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg')]
book.cover_url = 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg'
book.save!

description = "Two of the most popular frontend frameworks, Angular and Bootstrap, have undergone a major overhaul to embrace emerging web technologies so that developers can build cutting-edge web applications.
Inside this title you'll dive, fingers first, into the basics of both the tools, and once you're familiar with them, you'll move onto Bootstrap's new grid system and Angular's built-in directives. You'll then learn how to format output using Angular's pipes and how to make use of the built-in router to set up routes for all your components.
Webpack will be your buddy to wrap up your project. Then, after throwing in some SASS to make things pretty, you'll learn how to validate the forms you've built and debug your application. Finally, you'll go on to learn how to obtain smooth transitioning from Bootstrap to Angular and then how to hook up with a server and use Firebase as the persistence layer.
Once you're done with this book, you'll not only have a lovely little e-commerce application running, but you'll also take with you the confidence to innovate and build your own applications with ease."
book = Book.new(title: 'Web Development with Bootstrap 4 and Angular 2 - Second Edition',
                publication_year: 2016, price: 34.99, description: description,
                height: 6.4, width: 0.9, depth: 5.0)
book.authors << [Author.find_or_create_by(name: 'Sergey Akopkokhyants'),
                 Author.find_or_create_by(name: 'Stephen Radford')]
book.categories << [Category.find_by(name: 'Web Design'), Category.find_by(name: 'Web Development')]
# book.image_urls << [ImageUrl.create(url: 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg')]
book.cover_url = 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg'
book.save!

description = 'The Android OS has the largest installation base of any operating system in the world; there has never been a better time to learn Android development to write your own applications, or to make your own contributions to the open source community!
This “cookbook” will make it easy for you to jump to a topic of interest and get what you need to implement the feature in your own application. If you are new to Android and learn best by “doing,” then this book will provide many topics of interest.
Starting with the basics of Android development, we move on to more advanced concepts, and we’ll guide you through common tasks developers struggle to solve. The first few chapters cover the basics including Activities, Layouts, Widgets, and the Menu. From there, we cover fragments and data storage (including SQLite), device sensors, the camera, and GPS. Then we move on more advanced topics such as graphics and animation (including OpenGL), multi-threading with AsyncTask, and Internet functionality with Volley. We’ll also demonstrate Google Maps and Google Cloud Messaging (also known as Push Notifications) using the Google API Library.
Finally, we’ll take a look at several online services designed especially for Android development. Take your application big-time with full Internet web services without having to become a server admin by leveraging the power of Backend as a Service (BaaS) providers.'
book = Book.new(title: 'Android Application Development Cookbook - Second Edition',
                publication_year: 2016, price: 32.99, description: description,
                height: 6.4, width: 0.9, depth: 5.0)
book.authors << [Author.find_or_create_by(name: 'Rick Boyer'),
                 Author.find_or_create_by(name: 'Kyle Mew'),
                 Author.find_or_create_by(name: 'Asoj Talesra')]
book.categories << [Category.find_by(name: 'Mobile Development')]
# book.image_urls << [ImageUrl.create(url: 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg')]
book.cover_url = 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg'
book.save!

description = "Updated for Xcode 8, Swift 3, and iOS 10, iOS Programming: The Big Nerd Ranch Guide leads you through the essential concepts, tools, and techniques for developing iOS applications. After completing this book, you will have the know-how and the confidence you need to tackle iOS projects of your own. Based on Big Nerd Ranch's popular iOS training and its well-tested materials and methodology, this bestselling guide teaches iOS concepts and coding in tandem. The result is instruction that is relevant and useful.
 Throughout the book, the authors explain what's important and share their insights into the larger context of the iOS platform. You get a real understanding of how iOS development works, the many features that are available, and when and where to apply what you've learned."
book = Book.new(title: 'Swift Programming: The Big Nerd Ranch Guide 2nd Edition',
                publication_year: 2016, price: 32.99, description: description,
                height: 6.4, width: 0.9, depth: 5.0)
book.authors << [Author.find_or_create_by(name: 'Matt Mathias'),
                 Author.find_or_create_by(name: 'John Gallagher')]
book.categories << [Category.find_by(name: 'Mobile Development')]
# book.image_urls << [ImageUrl.create(url: 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg')]
book.cover_url = 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg'
book.save!

`rake books_parser:parse`

Delivery.create!(method: 'Delivery Next Day!', days_from: 3, days_to: 7, price: 5)
Delivery.create!(method: 'Pick Up In-Store', days_from: 5, days_to: 20, price: 0)
Delivery.create!(method: 'Expressit', days_from: 2, days_to: 3, price: 15)

Coupon.create!(code: '1q2w3e', discount: 1.00)
Coupon.create!(code: 'e3w2q1', discount: 10.00)
Coupon.create!(code: 'q1w2e3', discount: 15.00)
Coupon.create!(code: 'qwerty', discount: 5.00)

OrderStatus.create!(status: 'Waiting for Processing')
OrderStatus.create!(status: 'In Progress')
OrderStatus.create!(status: 'In Delivery')
OrderStatus.create!(status: 'Delivered')
OrderStatus.create!(status: 'Canceled')

ReviewStatus.create!(status: 'Approved')
ReviewStatus.create!(status: 'Unprocessed')
ReviewStatus.create!(status: 'Rejected')

Book.all.each do |book|
  users = User.all
  users_count = User.count
  review_status = ReviewStatus.all
  rand(6..12).times do
    user_id = users[rand(users_count)].id
    r = Review.new(user_id: user_id, book_id: book.id, rating: rand(1..5),
                   title: FFaker::Lorem.phrase, text: FFaker::Lorem.paragraph)
    r.review_status = review_status[rand(3)]
    r.save!
  end
end

Admin.create!(login: 'admin', email: 'admin@admin.com',
              password: 'bookstoreadmin', password_confirmation: 'bookstoreadmin')
