import express from "express";
import cors from "cors";
import morgan from "morgan";
import transaction from "./routes/transaction.routes";

const app = express();

app.set("port", 3000);

// Cross-origin resource sharing (CORS) is a mechanism that allows restricted resources on a web page to be requested from another domain outside the domain from which the first resource was served.
app.use(cors());

// HTTP request logger middleware
app.use(morgan("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// address where requests are made
app.use("/api", transaction);

export default app;
