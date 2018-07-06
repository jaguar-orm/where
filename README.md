# where

Showcases how to write 'WHERE' clauses using Jaguar ORM.

A simple 'WHERE' clause:

```dart
  Future<User> findByName(String name) => findOneWhere(this.name.eq(name));
```

A 'WHERE' clause using 'BETWEEN':

```dart
  Future<List<User>> ageBetween(int low, int high) =>
      findWhere(this.age.between(low, high));
```

A 'WHERE' clause using 'AND' operator:

```dart
  Future<List<User>> nameAndAge(String name, int low, int high) =>
      findWhere(this.name.eq(name) & this.age.between(low, high));
```

A 'WHERE' clause using 'OR' operator:

```dart
  Future<List<User>> ageAboveOrBelow(int low, int high) =>
      findWhere((this.age < low) | (this.age > high));
```