# MusiQ - flutter itunes search

<div align='center'>
   <img src='https://github.com/izier/musiQ/blob/main/screenshots/1.jpeg' width='240'>
   <img src='https://github.com/izier/musiQ/blob/main/screenshots/2.jpeg' width='240'>
   <img src='https://github.com/izier/musiQ/blob/main/screenshots/3.jpeg' width='240'>
</div>

MusiQ is a simple implementation of [iTunes search API] using Flutter. It uses Flutter BLoC for state management and implementing clean architecture. For now, the app tested using Edge browser, but still can be deployed for any Android phones.

## Features

- Search any song in Itunes
- Play and listen to the preview of the song
- Pause the song
- Play and search any song simultaneously

## Dependencies

MusiQ uses a number of libraries to work properly:

- [http] - providing http service
- [flutter_bloc] - providing state management
- [just_audio] - providing audio player capabilities
- [equatable] - simplify equality comparisons
- [dartz] - providing functional programming
- [cached_network_image] - caching loaded image
- [rxdart] - providing implementation of asynchronous programming
- [get_it] - providing easy service locator

## Installation

MusiQ requires Flutter 3 to be able to run

Install the dependencies and test the app using Edge or Chrome with Android Studio.


[//]: # 

   [get_it]: <https://pub.dev/packages/get_it>
   [http]: <https://pub.dev/packages/http>
   [flutter_bloc]: <https://pub.dev/packages/flutter_bloc>
   [just_audio]: <https://pub.dev/packages/just_audio>
   [equatable]: <https://pub.dev/packages/equatable>
   [dartz]: <https://pub.dev/packages/dartz>
   [cached_network_image]: <https://pub.dev/packages/cached_network_image>
   [rxdart]: <https://pub.dev/packages/rxdart>
   [iTunes search API]: <https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/Searching.html#//apple_ref/doc/uid/TP40017632-CH5-SW1>
   
