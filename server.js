import express from "express";
import { handler } from "./svelte/build/handler.js";

const app = express();
const port = 3000;

app.use(handler);

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});