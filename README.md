# Refugee help
App which will enable better organisation of volunteers and resources to help incoming refugees.  

Hello all, due to the refugee crisis in Ukraine and because I wanted to help I've decided to build an app dedicated for this using Flutter.  

It will be made available on web, Android and IOS.  

The app is open-source and everyone is welcomed to contribute to it. 
This project might be helpful not just for the current Ukraine crysis, but others around the world aswell.  

It allows citizens/businesses to enroll and offer their availability for housing/food/transportation/other services for those in need.  

Though I found out a Wordpress website exists already (refugees.ro), with similar capabilities of what I want to build, the app's target are not the refugees themselves, but the good people volunteering to help.

From my talks with hands-on people, there is a need of such an app, to help volunteers organize better. 
There were reported cases were refugees were taken and the "volunteer" drivers asked them money.   
Also, we have to keep in mind, that fleeing from war is something very confusing for people.  
We cannot expect people to think clearly that there are platforms which can help them or that on those platforms bad people exist 
which would try to take advantage of them.

With this app people can organize better and reduce risks for refugees. 

More so, because of the open-source nature of this project, it can live longer, improve and help other people in other parts of the world.  


Features which are needed initially:  
- registration and sign in using e-mail + password, Google and Apple ID;  
- volunteers will be able to add their services and availability, each with their unique data;  
- there will be a dispatcher which assigns refugees to volunteers and has access to a realtime database of volunteers and their offerings;   
- responsive for privileged users;   
- the app will be available in multiple languages; priority languages are english & romanian, with the hope of finding translators for other languages (such as: polish, hungarian, ukrainean, etc);   
- privileged users: dispatcher, administrator;  

Features which I want to implement in the future:  
- dispatcher dashboard;  
- administrator dashboard;  
- map view for what volunteers can offer with realtime availability; without registration;  
- refugees can add their needs, based on what volunteers can offer (housing/food/transportation/etc);  
- volunteers can see the needs and can contact them directly; 

Coding info:
- [Bloc](https://pub.dev/packages/flutter_bloc) package will be used for state management;  
- [Firebase](https://firebase.flutter.dev/) will be used for authentication, database, crashlytics and if needed storage, for faster development pace;  
- Material design will be used; later, maybe, we will implement adaptive widgets for IOS users but we will see;   
- Due to the crysis being now, we will skip code documentation (unless something really needs documentation), automated testing; if anyone wants to focus on creating tests, you are welcomed;  

Patterns and coding guidelines:
- flutter linter rules are enabled and we will code by them;  
- names should be explicit (UserModel, signIn, _repository, etc.), to be easily understood;   
- [Domain Driven Design](https://resocoder.com/2020/03/09/flutter-firebase-ddd-course-1-domain-driven-design-principles/) is used for structuring the project; the layers are: application (for cubits and states), domain (for models and repositories), infrastructure (for utilities) and presentation (for everything which is a Widget);  
- [freezed](https://pub.dev/packages/freezed) will be used for models and state classes;  
- repository pattern classes will be used for communication with Firebase; both a repository base class and interfaces will be provided;  
- build interfaces only if there is need for such things, do not over-complicate the code by adding interfaces everywhere; build interface if at least 2 or more implementations use the same interface;  
- do not extend widgets, prefer composition over inheritance when dealing with widgets;  
- do not make every widget stateful, use stateful widget only if is needed;  
- build widgets in separate classes, instead of helper methods, to keep code cleaner;  
- do not build a BloC for easy tasks; use BloC when dealing with backend and/or there are a lot of changes in the screen;  
- prefer Cubit over Bloc;  
- if a class member is not explicitly required to be public, make it private;  

Anyone is welcomed to contribute anyway they can:
- recommend/request features;
- report bugs;
- recommend improvements;
- help with coding;
- add translations;
- building automated tests (unit/widgets testing);
