var details = Backbone.Model.extend({
	defaults: {
		pageName: "",
		CreatedBy: "Raju"
	}
});

var detail1 = new details({
	pageName: "Product",
	CreatedBy: "Raju"
});

//Testing url - file:///J:/Coding/backboneJS/index.html#home

var router = Backbone.Router.extend({
	routes : {
		'home' : 'home',
		'products' : 'products',
		'contact' : 'contact'
	},

	home : function() {
		console.log("In home method");
		$("#container").html("<h1>Home Page</h1>");
	},

	products : function() {
		console.log("In products");
		new productView();		
	},

	contact : function() {
		console.log("In contact");
		$("#container").html("<h1>Contact Page</h1>");
	}
});

var productView = Backbone.View.extend({
	initialize: function(){
		this.render();
	},
	model: detail1,
	render: function() {
		$("#container").html("<h1>Products View</h1>");
	}
});



$(document).ready(function () {
    router = new router();
    Backbone.history.start(); //pushState -To avoid # in the urls.
})

/*var mainView = Backbone.View.extend ({
    el: "body",

    events: {
        "click a[id=link1]": "load_page"
    },

	initialize: function () {
    	
    },

    load_page : function() {
    	console.log("load_page");
    }
});

 return new mainView();*/