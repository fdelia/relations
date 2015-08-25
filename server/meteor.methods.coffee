RelationsApp = {
	# persons
	newPerson: (name) ->
		obj = {
			name: name,
			createdAt: Date.now()
		}
		obj._id = Persons.insert(obj)
		console.log 'insert person'
		console.log obj
		return obj

	getPersonFromName: (name) ->
		obj = Persons.findOne({name: name})
		if !obj then obj = @newPerson(name)
		return obj

	# processes
	newProcess: (name) ->
		obj = {
			name: name,
			createdAt: Date.now()
		}
		obj._id = Processes.insert(obj)
		console.log 'insert process'
		console.log obj
		return obj

	getProcessFromName: (name) ->
		obj = Processes.findOne({name: name})
		if !obj then obj = @newProcess(name)
		return obj

	# ressources
	newRessource: (name) ->
		obj = {
			name: name,
			createdAt: Date.now()
		}
		obj._id = Ressources.insert(obj)
		console.log 'insert ressource'
		console.log obj
		return obj

	getRessourceFromName: (name) ->
		obj = Ressources.findOne({name: name})
		if !obj then obj = @newRessource(name)
		return obj
}


Meteor.methods({
	addRelation: (person, process, ressource) ->
		obj = {
			personId: RelationsApp.getPersonFromName(person)._id,
			processId: RelationsApp.getProcessFromName(process)._id,
			ressourceId: RelationsApp.getRessourceFromName(ressource)._id,
			createdAt: Date.now()
		}

		obj._id = Relations.insert(obj)
		console.log 'add relation'
		console.log obj

		return obj
})