// Finds the intersection of a ray with a sphere.
// origin is the ray origin relative to the sphere
// ray is the ray direction (normalized)
// radius is the sphere radius
//
// Implements the algorithm described here that bypasses precision issues:
// "Precision Improvements for Ray/Sphere Intersection"
// By: Eric Haines, Johannes Gunther, and Tomas Akenine-Moller
// https://link.springer.com/content/pdf/10.1007/978-1-4842-4427-2_7.pdf
Intersection sphereIntersection(vec3 origin, vec3 ray, float radius) {
  float b = -dot(origin, ray);
  vec3 w = origin + b * ray;
  float r2 = radius * radius;
  float d = r2 - dot(w, w);
  if(d < 0.0) {
    return Intersection(0.0, 0.0, 0, false);
  }
  if(d == 0.0) {
    return Intersection(b, b, 1, false);
  }
  float c = dot(origin, origin) - r2;
  float sqrtd = sqrt(d);
  float q = b + sign(b) * sqrtd;
  float t0 = c / q;
  float t1 = q;
  int hits = int(t0 >= 0.0) + int(t1 > 0.0);
  return Intersection(min(t0, t1), max(t0, t1), hits, c < 0.0);
}

#pragma glslify: export(sphereIntersection)