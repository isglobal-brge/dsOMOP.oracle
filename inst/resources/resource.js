var dsOMOP_oracle = {
  settings: {
    title: "OMOP CDM (Oracle Extension)",
    description:
      "Extends the functionality of the <a href='https://www.github.com/isglobal-brge/dsOMOP' target='_blank'>dsOMOP</a> package to support OMOP CDM databases in Oracle. Requires the <a href='https://www.github.com/isglobal-brge/oracle.resourcer' target='_blank'>oracle.resourcer</a> package.",
    web: "https://github.com/isglobal-brge/dsOMOP.oracle",
    types: [
      {
        name: "omop-cdm-oracle",
        title: "OMOP CDM Database (Oracle)",
        description:
          'Connection to an OMOP CDM database in Oracle. The connection will be established using <a href="https://www.r-dbi.org" target="_blank">DBI</a>.',
        tags: ["omop-cdm"],
        parameters: {
          $schema: "http://json-schema.org/schema#",
          type: "array",
          items: [
            {
              key: "host",
              type: "string",
              title: "Host name or IP address",
            },
            {
              key: "port",
              type: "integer",
              title: "Port number",
            },
            {
              key: "db",
              type: "string",
              title: "Database name",
            },
            {
              key: "schema",
              type: "string",
              title: "Schema (optional)",
              description: "If not provided, the default schema will be used.",
            },
            {
              key: "vocabulary_schema",
              type: "string",
              title: "Vocabulary schema (optional)",
              description: "Use in case the vocabulary tables are in a different schema. If not provided, the default schema will be used.",
            },
          ],
          required: ["host", "port", "db"],
        },
        credentials: {
          $schema: "http://json-schema.org/schema#",
          type: "array",
          items: [
            {
              key: "username",
              type: "string",
              title: "Username",
            },
            {
              key: "password",
              type: "string",
              title: "Password",
              format: "password",
            },
          ],
          required: ["username", "password"],
        },
      },
    ],
  },
  asResource: function (type, name, params, credentials) {
    var OMOPCDMResource = function (name, params, credentials) {
      var resourceUrl =
        "oracle://" +
        params.host +
        ":" +
        params.port +
        "/" +
        params.db;
      
      if (params.schema || params.vocabulary_schema) {
        resourceUrl += "?";
        if (params.schema) {
          resourceUrl += "schema=" + params.schema;
        }
        if (params.vocabulary_schema) {
          resourceUrl += (params.schema ? "&" : "") + "vocabulary_schema=" + params.vocabulary_schema;
        }
      }
      
      return {
        name: name,
        url: resourceUrl,
        format: "omop.cdm.db",
        identity: credentials.username,
        secret: credentials.password,
      };
    };
    var toResourceFactories = {
      "omop-cdm-oracle": OMOPCDMResource,
    };
    if (toResourceFactories[type]) {
      return toResourceFactories[type](name, params, credentials);
    }
    return undefined;
  },
};