import { Router } from "express";
import { getTransactions, addTransaction } from "../controllers/transaction";

const router = Router();

router.get("/transactions", getTransactions);
router.post("/transactions", addTransaction);
// TODO
// router.put('/transactions/:id', updateTransactionById);
// router.delete('/transactions', deleteTransactionById);

export default router;
