import 'package:flutter/material.dart';

List<Step> JoinFormSteps = [
    Step(
      title: const Text('Email for login'),
      isActive: true,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Email Address'),
          ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('Mobile number for security'),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Phone Number'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: '6-digit code'),
          ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('Personal details'),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'First name'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Last name'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Promo code (Optional)'),
          ),
          
        ],
      ),
    ),
    Step(
      title: const Text('Finish'),
      subtitle: const Text("Go to shop"),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    ),
  ];