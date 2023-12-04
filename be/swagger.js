module.exports = {
    openapi: "1.0.0", // present supported openapi version
    info: {
        title: "Document API", // short title.
        description: "123code.net", //  desc.
        version: "1.0.0", // version number
        contact: {
            name: "PhuPhan", // your name
            email: "codethue94@gmail.com", // your email
            url: "123code.net", // your website
        },
    },


};

exports.option  = {
	definition: {
	  openapi: "3.1.0",
	  info: {
		title: "LogRocket Express API with Swagger",
		version: "0.1.0",
		description:
		  "This is a simple CRUD API application made with Express and documented with Swagger",
		license: {
		  name: "MIT",
		  url: "https://spdx.org/licenses/MIT.html",
		},
		contact:  {
            name: "PhuPhan", // your name
            email: "codethue94@gmail.com", // your email
            url: "123code.net", // your website
        },
	  },
	  servers: [
		{
		  url: "http://localhost:" + process.env.PORT + "/api/v1",
		},
	  ],
	},
	apis: ["./routes/*.js"],
  };
