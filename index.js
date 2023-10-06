const cors = require('cors');
const express = require('express');
const app = express();
const port = 4000; // process.env.PORT 사용
const mysql = require('mysql');

let corsOptions = {
    origin: '*',
    credentials: true // 사용자 인증에 필요한 리소스 허용
  }

app.use(cors(corsOptions));

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root', // 데이터베이스 사용자 이름
  password: '', // 데이터베이스 비밀번호
  database: 'react_bbs',
});

db.connect();

app.get('/', (req, res) => {
  const sqlQuery = "INSERT INTO requested (rowno) VALUES (1)";
  db.query(sqlQuery, function (err, result) {
    if (err) {
      console.error(err);
      return res.status(500).send('Error occurred');
    }
    
    res.send('Success');
  });
});


app.get('/list', (req, res) => {
    const sqlQuery = "SELECT * FROM board";
    db.query(sqlQuery, function (err, result) {
      if (err) {
        console.error(err);
        return res.status(500).send('Error occurred');
      }
      
      res.send(result);
    });
  });

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
