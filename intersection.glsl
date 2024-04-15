struct Intersection {
  float t0;
  float t1;
  int hits; // forward hits
  bool isInside;
};

#pragma glslify: export(Intersection)