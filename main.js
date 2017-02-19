var Person = function (config) {
  this.name = config.name;
  this.age = config.age;
  this.occupation = config.occupation;
};

Person.prototype.work = function () {
  return this.name + ' is working.';
};


//Tutorial starts...
//Model-1
var Song = Backbone.Model.extend({
	
	defaults : {
		name : 'raju'
	},

	initialize : function (){
		console.log("A new song has been created");
	}
});

var song = new Song();
console.log('name: ' + song.get('name'));



//Model-2
var MSong = Backbone.Model.extend();
var song2 = new MSong({ title : 'Blue in Green'});



//Views
var SongView = Backbone.View.extend({
	render : function() {
		this.$el.html(this.model.get('title'));
		return this;
	}	
});

var songView = new SongView({el : '#container', model: song2});
songView.render();

//$('#container').html(songView.$el);

