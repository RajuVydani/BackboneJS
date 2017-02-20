//underscore js examples.

// just coz of lack of a standard tuple type in JS. 
// Also to make paths unique we can use a prefix like '/' 
// rather than positional checking with indexes

var pathName = "/api/v3/quality/teamleads/001wenger/dashboard";

var roles = [ [ "/analysts", "analyst_id" ], [ "/teamleads", "teamlead_id" ] ,  [ "/managers", "manager_id" ] , [ "/seniormanagers", "senior_manager_id" ] ,[ "/download", "" ] ]; 

var roleNameID = _.chain(roles)
                     .filter(function(r) {
                       return pathName.includes(r[0]);
                     })
                     .map(function(f) {
                       return { name: f[0], id: f[1] !== "" ? "request.params["+f[1]+"]" : f[1] };
                     })
                     .first()
                     .value();
console.log("pathIdentified::" + JSON.stringify(roleNameID));

//var path = [{name : "/teamleads", id: 001} ];

var path = _.chain(roles)
                     .filter(function(r) {
                       return pathName.includes(r[0]);
                     })
                     .map(function(f) {
                       return { name: f[0], id: f[1] !== "" ? "request.params["+f[1]+"]" : f[1] };
                     });
console.dir(path);
console.dir(path.first());
console.dir(path.first().value());

/*_.first(path, function (r){
	console.log("test");
	console.log("firstelement::"+r.value());
});*/