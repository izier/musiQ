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

To run the musiQ app locally, ensure that you have Flutter SDK installed on your system. Then, follow these steps:

1. Clone the repository:

```bash
git clone https://github.com/izier/musiQ.git
```
2. Navigate to the project directory:

```bash
cd musiQ
```
3. Fetch the required dependencies:

```bash
flutter pub get
```
4. Build and run the app:

```bash
flutter run
```

## Contributing

Contributions to musiQ are always welcome! If you have any bug reports, feature requests, or suggestions, please open an issue on the GitHub repository. If you would like to contribute code, you can fork the repository and create a pull request with your changes.

Please ensure that your code adheres to the existing coding style and that you have tested your changes thoroughly before submitting a pull request.

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
   
