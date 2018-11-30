const angle = 360 * (25 / 100);
const angle_in_radians = Math.PI / 180 * angle;
console.log(angle_in_radians);
const sin_angle = Math.sin(angle_in_radians);
const cos_angle = Math.cos(angle_in_radians);
const radius = 200;
console.log([radius * sin_angle, radius * cos_angle]);
