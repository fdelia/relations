class RelationsApp
	constructor: (@$q) ->

		return {
			addRelation: @addRelation,
			getRelations: @getRelations,
			timeSince: @timeSince
		}




	addRelation: (person, process, ressource) =>
			def = @$q.defer()

			if !person or !process or !ressource
				# TODO error handling for user
				def.reject('missing input')

			else
				Meteor.call 'addRelation', person, process, ressource, (err, res) ->
					if err
						# console.error 'error adding new relation: '+err
						def.reject(err)
					else
						def.resolve('relation added')
				
			return def.promise


	getRelations: () ->
			relations = Relations.find({}, {
				sort: {
					createdAt: -1
				}
			}).fetch()
			
			relations = relations.filter (relation) ->
				relation.person = Persons.findOne({_id: relation.personId})
				relation.process = Processes.findOne({_id: relation.processId})
				relation.ressource = Ressources.findOne({_id: relation.ressourceId})

				# if one of these is not set, don't include it in the returned array
				relation.person and relation.process and relation.ressource

			return relations




	timeSince: (date) ->
		if typeof date is 'object'
			date = new Date(date)

		seconds = Math.floor((new Date() - date) / 1000);

		interval = Math.floor(seconds / 31536000)
		if interval >= 1
			intervalType = 'year'
		else
			interval = Math.floor(seconds / 2592000)
			if interval >= 1
				intervalType = 'month'
			else
				interval = Math.floor(seconds / 86400)
				if interval >= 1
					intervalType = 'day'
				else
                	interval = Math.floor(seconds / 3600);
                	if interval >= 1
                		intervalType = 'hour'
                	else 
	                    interval = Math.floor(seconds / 60);
	                    if interval >= 1
	                    	intervalType = 'minute'
	                    else
	                    	interval = seconds
	                    	intervalType = 'second'

	    if interval > 1 or interval is 0
	    	intervalType += 's'

	    return interval + ' ' + intervalType;







RelationsApp.$inject = ['$q']
# needs to be a service, since services are invoked with "new" -> singleton 
# else the class methods in the constructor aren't found (they are undefined then)
angular.module('app').service 'RelationsApp', RelationsApp