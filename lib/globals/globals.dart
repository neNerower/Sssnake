library globals;

import 'package:flutter/material.dart';
import 'package:snake/models/field/speed.dart';

// Device screen size
late Size dSize;

// Game field size in sells amount
int fieldWidth = 20;
int fieldHeight = 1;

// Game speed level
Speed speedLvl = Speed.normal;