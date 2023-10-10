const cors = require("cors");
const express = require("express");
const app = express();
const port = 4000;
const mysql = require("mysql");

app.use(express.json()); //json은 말그래도 json 형태의 데이터 전달 의미
app.use(express.urlencoded({ extended: false }));

let corsOptions = {
  origin: "*",
  credentials: true, //사용자 인증 리소스
};

app.use(cors(corsOptions));

const db = mysql.createConnection({
  host: "localhost",
  user: "root", // 데이터베이스 사용자 이름
  password: "", // 데이터베이스 비밀번호
  database: "react_bbs",
});

db.connect();

app.get("/", (req, res) => {
  const sqlQuery = "INSERT INTO requested (rowno) VALUES (1)";
  db.query(sqlQuery, function (err, result) {
    if (err) {
      console.error(err);
      return res.status(500).send("Error occurred");
    }

    res.send("Success");
  });
});

app.get("/list", (req, res) => {
  //res.send('Hello World!');
  const sqlQeury =
    "SELECT BOARD_ID, BOARD_TITLE, REGISTER_ID, DATE_FORMAT(REGISTER_DATE, '%Y-%m-%d') AS REGISTER_DATE  FROM board";
  db.query(sqlQeury, function (err, result) {
    if (err) throw err;
    res.send(result);
  });
});

app.get("/detail", (req, res) => {
  //res.send('Hello World!');
  const id = req.query.id;
  const sqlQeury =
    "SELECT BOARD_ID, BOARD_TITLE, BOARD_CONTENT,REGISTER_ID, DATE_FORMAT(REGISTER_DATE, '%Y-%m-%d') AS REGISTER_DATE  FROM board WHERE BOARD_ID=?";
  db.query(sqlQeury, [id], (err, result) => {
    if (err) throw err;
    res.send(result);
    console.log(result);
  });
});

app.post("/update", (req, res) => {
  //res.send('Hello World!');
  const { title, content, id } = req.body;

  const sqlQeury = `UPDATE BOARD SET BOARD_TITLE=?, BOARD_CONTENT=? where BOARD_ID=${id}`;
  db.query(sqlQeury, [title, content], (err, result) => {
    if (err) throw err;
    res.send(result);
    console.log(result);
  });
});

app.post("/insert", (req, res) => {
  // const title = req.body.title;
  // const content = req.body.content;
  const { title, content } = req.body;

  const sqlQeury =
    "INSERT INTO board (BOARD_TITLE,BOARD_CONTENT,REGISTER_ID ) values (?, ?,'admin') ";
  db.query(sqlQeury, [title, content], function (err, result) {
    if (err) throw err;
    res.send(result);
  });
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
