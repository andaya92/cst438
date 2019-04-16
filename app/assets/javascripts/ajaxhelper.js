// post requests using Fetch API
const postToAPI = (url='', data = "") => {
	return fetch(url,{
				"method" : "POST",
				"headers" : {
					'Content-Type': "application/json; charset=utf-8"
				},
				'body': JSON.stringify( Object.assign({"":""}, data, {"authenticity_token": AUTH_TOKEN} ))
			})
			.then(response => response.json());
}

// get requests using Fetch API
 const getFromAPI = (url='') => {
	return fetch(url,{
				"method" : "GET",
				"headers" : {
					'Content-Type': "application/json; charset=utf-8"
				}
			})
			.then(response => response.json());
}


// post requests using Fetch API
const deleteFromAPI = (url='', data = "") => {
	return fetch(url,{
				"method" : "DELETE",
				"headers" : {
					'Content-Type': "application/json; charset=utf-8"
				},
				'body': JSON.stringify( Object.assign({"":""}, data, {"authenticity_token": AUTH_TOKEN} ))
			})
			.then(response => response.json());
}