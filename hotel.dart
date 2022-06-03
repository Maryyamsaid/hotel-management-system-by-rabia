import 'dart:io';

// import 'customer.dart';
// import 'hotel.dart';
// import 'owner.dart';
// import 'manager.dart';
// import 'customer.dart';

main() {
  int userType;
  Hotel hotel = Hotel(
      id: 234, name: 'Al Imran Hotel', noOfRooms: 30, address: 'Islamabad');

  Owner owner = Owner(
      id: 12, name: 'Ismail', email: 'ismail@gmail.com', address: 'Rawalpindi');

  Manager manager = Manager(
      id: 13,
      name: 'Shakeel',
      email: 'shakeel@gmail.com',
      address: 'Islamabad');

  Customer customer =
      Customer(id: 1, name: 'maryam', email: 'AZ@GMAIL.COM', address: 'ACS');
  List<Customer> list = [];

  do {
    print('Wellcome to Al Imran Hotel');
    print(hotel);
    print(
        'press 1:If you are owner\n press 2: if you are manager\n press 3: if you are Customer');
    userType = int.parse(stdin.readLineSync()!);
    if (userType == 1) {
      print('Log in to the System');
      print('enter id');
      int id = int.parse(stdin.readLineSync()!);
      print('enter name');
      String name = stdin.readLineSync()!;

      if (owner.id == id && owner.name == name) {
        print('Welcome dear owner');
        print('What you want to do?');
        print(
            '1 to view your own detail, 2 to view hotel detal 3 to view customers detail 4 to update hotels available rooms details 5 to delete customer');
        int view = int.parse(stdin.readLineSync()!);
        if (view == 1) {
          print(owner);
        } else if (view == 2) {
          print(hotel);
        } else if (view == 3) {
          print(customer);
        } else if (view == 4) {
          print('enter reserved rooms');
          int rooms = int.parse(stdin.readLineSync()!);
          hotel.availableRooms = rooms;

          print(hotel);
        } else if (view == 5) {
          print('enter customeer id to delete');
          int id = int.parse(stdin.readLineSync()!);
          list.remove(id);
          print(hotel);
        }
      } else {
        print("entered information is wrong try again");
      }
    } else if (userType == 2) {
      print('Log in to the System');
      print('enter id');
      int id = int.parse(stdin.readLineSync()!);
      print('enter name');
      String name = stdin.readLineSync()!;

      if (manager.id == id && manager.name == name) {
        print('Welcome dear manager');
        print('What you want to do?');
      } else {
        print("entered information is wrong try again");
      }
    } else if (userType == 3) print('already you have an account?');
    print('press yes or no');
    String account = stdin.readLineSync()!;
    if (account == 'no') {
      customer =
          Customer(id: 13, name: 'ABC', email: 'abc@gmail.com', address: 'ACD');
      list.add(customer);
    } else if (account == 'yes') {
      print('Log in to the System');
      print('enter id');
      int id = int.parse(stdin.readLineSync()!);
      print('enter name');
      String name = stdin.readLineSync()!;

      if (customer.id == id && customer.name == name) {
        print('Welcome dear owner');
        print('What you want to do?');
      } else {
        print("entered information is wrong try again");
      }
    }
  } while (true);
}

//import 'hotel.dart';

class Customer {
  final int id;
  final String name;
  final String email;
  final String address;
  late int price;
  //int
//Customer(){};
  Customer(
      {required this.id,
      required this.name,
      required this.email,
      required this.address});

  void booking(int noOfRooms) {
    price = price * noOfRooms;
  }

  @override
  String toString() {
    return 'Name: $name\n Email: $email\n Address: $address';
  }
}

class Manager {
  final int id;
  final String name;
  final String email;
  final String address;

  Manager(
      {required this.id,
      required this.name,
      required this.email,
      required this.address});

  @override
  String toString() {
    return 'Name: $name\n Email: $email\n Address: $address';
  }
}

class Owner {
  final int id;
  final String name;
  final String email;
  final String address;

  Owner(
      {required this.id,
      required this.name,
      required this.email,
      required this.address});

  @override
  String toString() {
    return 'Name: $name\n Email: $email\n Address: $address';
  }
}

class Hotel {
  final int id;
  final String name;
  final int noOfRooms;
  final String address;
  late int _availableRooms = 0;
  late int _reservedrooms = 0;
  late double price = 20000;
  //Hotel.rooms(){}
  Hotel(
      {required this.id,
      required this.name,
      required this.noOfRooms,
      required this.address});

  void set availableRooms(int rooms) {
    this._availableRooms = noOfRooms - rooms;
  }

  int get reservedrooms {
    return this._availableRooms;
  }

  int get availableRooms {
    return this._reservedrooms = noOfRooms - _availableRooms;
  }

  @override
  String toString() {
    return 'Name:$name\n Total No Of Rooms: $noOfRooms\n Address: $address\n Available Rooms: $_availableRooms';
  }
}
