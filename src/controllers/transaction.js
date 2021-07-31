import { getConnection } from "../database/connection";

// TODO: Validation

export const getTransactions = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool.request().execute("getTransactions");
    res.json(result.recordset);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

export const addTransaction = async (req, res, params) => {
  const {
    OriginAccount,
    BankName,
    DestinyAccount,
    DestinyDocument,
    Currency,
    Amount,
    Concept,
  } = req.body;

  try {
    const pool = await getConnection();
    await pool
      .request()
      .input("OriginAccount", OriginAccount)
      .input("BankName", BankName)
      .input("DestinyAccount", DestinyAccount)
      .input("DestinyDocument", DestinyDocument)
      .input("Currency", Currency)
      .input("Amount", Amount)
      .input("Concept", Concept)
      .execute("addTransaction");
    res.json(req.body);
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

// TODO: Update
// TODO: Delete
// TODO: Count
// TODO: Total?
