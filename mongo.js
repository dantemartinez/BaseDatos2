// Ejercicio 1

db.getCollection('films').find({ Rating:'PG-13' },{ Title: 1, 'Special Features':1})

// Ejercicio 2

db.getCollection('films').distinct('Length')
	
// Ejercicio 3

db.getCollection('films').find({Replacement_Cost:'20'})
