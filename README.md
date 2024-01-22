# firebase_setu_original

to get key:
mac:
```
 keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore -storepass android -keypass android
```


------


(base) adityagaur@Gaurs-MacBook-Pro firebase_setu_original % dart pub global activate flutterfire_cli

  export PATH="$PATH":"$HOME/.pub-cache/bin"

(base) adityagaur@Gaurs-MacBook-Pro firebase_setu_original % export PATH="$PATH":"$HOME/.pub-cache/bin"
(base) adityagaur@Gaurs-MacBook-Pro firebase_setu_original % flutterfire configure --project=fir-setup-original

(base) adityagaur@Gaurs-MacBook-Pro firebase_setu_original % keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore -storepass android -keypass android

(base) adityagaur@Gaurs-MacBook-Pro firebase_setu_original % flutterfire config

(base) adityagaur@Gaurs-MacBook-Pro firebase_setu_original % flutterfire config

# Get (Getx and Getx Controller)
> GetX is a state management library for Flutter that helps manage the state of your application efficiently. It provides solutions for dependency injection, state management, and routing.

## Need of Getx: 
> Assume a **User** class without getx controller.
 ```
class User{
  final int variable1 = 0;
  final String stringVariable = "Some Variable";
  void sum (int a, int b) {
    return a+b;
   }
}

 ```
therefore to call out this class we need to create objects(or instances).
example:
```
final user= new User();
```
so basically we use this in application or website to store memory in backend in form of 0 and 1's.
eg.
![Screenshot 2024-01-22 at 5 48 35 PM](https://github.com/adityagaur0/firebase_setup_original/assets/112656570/c596e8ca-0bd5-4aca-9b02-5482fd33c6d9)

**BUT** if we are using this instance for 10 to 20 places the total memory it occupy will be 20x for 20 instance.

*therefore* we extend the class with ***Getx*** as it helps us to create a single instance and through which we can reuse this instance in multiple place
eg.
![Screenshot 2024-01-22 at 5 52 05 PM](https://github.com/adityagaur0/firebase_setup_original/assets/112656570/f7cc3c46-0a40-410b-aac0-d049c9d412fd)

![Screenshot 2024-01-22 at 5 52 17 PM](https://github.com/adityagaur0/firebase_setup_original/assets/112656570/af1607af-2b83-4b80-b3e6-aed5cf81269b)
