# Flutter Todo App with Hive Database

This is a simple todo application built using Flutter framework, with Hive as the database management solution. It allows users to create, update, delete, and mark tasks as completed.

## Features

- Add new tasks with title
- Mark tasks as completed
- Delete tasks
- Store tasks locally using Hive database

## Getting Started

These instructions will help you set up and run the project on your local machine.

### Prerequisites

- Make sure you have Flutter installed on your machine. If not, you can follow the official installation guide [here](https://flutter.dev/docs/get-started/install).
- Basic knowledge of Flutter and Dart programming language.

### Installation

1. Clone the repository to your local machine:
```
    git clone https://github.com/kaybrian/flutter_tod.git
```

2. Navigate to the project directory:
```
    cd flutter_tod
```

3. Install dependencies:
```
    flutter pub get
```

4. Run the application:
```
    flutter run
```


### How to Use

- Upon launching the app, you'll be presented with a list of tasks (Default tasks are shown).
- To add a new task, tap on the '+' button and fill in the required details.
- To mark a task as completed, simply tap on the checkbox next to the task.
- To delete a task, swipe left on the task and confirm deletion.

## Database Management with Hive

Hive is used as the database solution for this application. It is a lightweight and fast key-value database written in Dart. Hive stores data in the form of boxes, which act like tables in a traditional database. In this app, each task is stored as a box entry.

### Hive Setup

1. Add Hive and path_provider dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  hive: ^2.0.4
  hive_flutter: ^1.1.0
  path_provider: ^2.0.2

