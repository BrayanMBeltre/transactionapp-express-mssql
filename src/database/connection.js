const mssql = require("mssql");

// TODO: DOT-ENV

export const getConnection = async () => {
  try {
    return await mssql.connect({
      user: "sa",
      password: "admin",
      server: "localhost",
      database: "bankapp",
      // port: 1433,
      options: {
        encrypt: true, // for azure
        trustServerCertificate: true, // change to true for local dev / self-signed certs
      },
    });
  } catch (error) {
    console.error(error);
  }
};

export { mssql };
