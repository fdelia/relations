// This file needs to have global scope

Persons = new Mongo.Collection('Persons');
Processes = new Mongo.Collection('Processes');
Ressources = new Mongo.Collection('Ressources');

Relations = new Mongo.Collection('Relations');

// add model specifications here



Meteor.startup(function() {
	
});