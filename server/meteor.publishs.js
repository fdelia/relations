

Meteor.publish('Persons', function() {
	return Persons.find();
});

Meteor.publish('Processes', function() {
	return Processes.find();
});

Meteor.publish('Ressources', function() {
	return Ressources.find();
});

Meteor.publish('Relations', function() {
	return Relations.find();
});