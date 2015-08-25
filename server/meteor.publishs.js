


Meteor.startup(function() {
	// add indexes for performance
	// we are always doing queries over the same fields
	// Comments._ensureIndex({
	//   postId: 1
	// });
	// Likes._ensureIndex({
	//   on: 1
	// });
	// Notifications2._ensureIndex({
	//   userId: 1
	// });
	// AnonymousUsers._ensureIndex({
	//   talkgOnPost: 1,
	//   isUser: 1
	// });
	// Conversations._ensureIndex({
	//   userId: 1,
	//   toUser: 1
	// });
	// Messages._ensureIndex({
	//   convId: 1
	// });

});



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