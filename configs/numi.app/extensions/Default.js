// Numi extension examples
// Please restart Numi on changes

// Declare global variable myvar
// numi.setVariable("myvar", { "double": 5, "unitId" : "USD" });
// numi.setVariable("anothervar", 333);

// Declare new horse unit, 1 horse = 2.4 meters
// numi.addUnit({
//    "id": "horse",
//    "phrases": "horse, horses, hrs",
//    "baseUnitId": "m",
//    "format" : "hrs",
//    "ratio" : 2.4,
// });

// Custom zum function, that calculates sum of two passed variables, like zum(2;3)
// numi.addFunction({ "id": "zum", "phrases": "zum" }, function(values) {
//     return { "double": values[0].double + values[1].double };
// });
