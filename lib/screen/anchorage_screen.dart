import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Card(
  child: ListTile(
  leading: CircleAvatar(
  backgroundImage: NetworkImage(
  employee.imageUrl),
  ),
  title: Text(employee.name),
  subtitle: Text(employee.department),
  onTap: () {
  // 상세 정보 화면으로 이동
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (BuildContext context){

    return Container(
      height: 200,
      child: Center(
        child: Text('내용'),
      ),
    );
  },
  ),
  );
  },
  ),
  );
  }
}

class Employee {
  final String name;
  final String department;
  final String imageUrl;

  Employee({required this.name, required this.department, required this.imageUrl});
}