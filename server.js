__dirname = 'C:/Users/Acer/Desktop/Rohith Drive/Sem5/DBMS/DBMS_Project/fpi-web-dev/'
const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 3000

app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

require('dotenv').config({ path: './.env' })
const Pool = require('pg').Pool
const { path } = require('express/lib/application')
const res = require('express/lib/response')
const { application } = require('express')
const pool = new Pool({
  user: process.env.FOOD_DB_USER,         //postgres
  host: process.env.FOOD_DB_HOST,         //localhost
  database: process.env.FOOD_DB_NAME,     //food
  password: process.env.FOOD_DB_PASSWORD, //********
  port: 5433,
})

app.get('/', (req,res) => {
    res.sendFile(__dirname + 'homepage.html')
    console.log({ info: 'Node.js, Express, and Postgres API, Database food initiated' })
})

app.get('/login',(req,res) => {
  res.sendFile(__dirname + 'loginpage.html')
})

app.get('/user',(req,res) => {
  res.sendFile(__dirname + 'userpage.html')
})

app.post('/login',(req,res,err) => {
  
  const username = req.body.username
  const password = req.body.password
  console.log(username,password)
  pool.query("SELECT * FROM Customer WHERE username=$1 and password=$2",values=[username,password],(err,result) =>{
    if(err){
      console.log('Invalid Login Credentials !')
    }
    console.log("Logged in successfully")
    res.setHeader("content-type","application/json")
    //res.send(JSON.stringify("Logged in as : "+result.rows[0]['username']))
    //console.log(JSON.stringify(result.rows))
    res.send(JSON.stringify(result.rows))
    //res.redirect("/user")
  })
    if(err){
      console.log(err)
    }
})

app.get('/investor',(req,res) =>{
  res.sendFile(__dirname + 'investor.html')
})

app.get('/api/investor',(req,res) => {
  pool.query("SELECT * from Investor",(err,result) =>{
    if(err){
      console.log('Invalid Login Credentials !')
    }
    console.log(result.rows)
    res.setHeader("content-type","application/json")
    res.send(JSON.stringify(result.rows))
  }
  )
})

app.get('/products',(req,res,err) => {
  console.log("products backend called")
  pool.query("SELECT productid,productname,price FROM product",(err,result) =>{
    if(err){
      console.log('Invalid Login Credentials !')
    }
    console.log(result.rows)
    res.setHeader("content-type","application/json")
    res.send(JSON.stringify(result.rows))
  }
  )
})

app.get('/order',(req,res) => {
  res.sendFile(__dirname + 'order.html')
})



app.post('/order',(req,res) => {
  const cid = req.body.customerid
  console.log(cid)
  pool.query("SELECT * from foodorder where customerid=$1",values=[cid],(err,result)=>{
    if(err){
      console.log("No order data")
    }
    res.setHeader("content-type","application/json")
    console.log(result)
    res.send(JSON.stringify(result.rows))
  })
})

app.post('/api/buy',(req,res) =>{
  const productid = req.body.productid
  const qty = req.body.qty
  const payment = req.body.payment
  //const cid = localStorage.getItem('cid')
  const cid = req.body.customerid
  const confirm ="No"
  var characters = "ABCDEFGHIJKLMNOPQRSTUVWXTZ123456789";    
            //specify the length for the new string  
  var lenString = 5;  
  var orderid = '';  

          //loop to select a new character in each iteration  
  for (var i=0; i<lenString; i++) {  
      var rnum = Math.floor(Math.random() * characters.length);  
      orderid += characters.substring(rnum, rnum+1);  
  }  
  const date = new Date();
  const day= date.getDate();
  const month = date.getMonth();
  const year = date.getFullYear();
  var finaldate = year + '-' + month + '-' + day;
  pool.query("insert into foodorder values($1,$2,$3,$4,$5,$6,$7)",values=[orderid,finaldate,cid,qty,productid,payment,confirm],(err,result) =>{
    console.log("Order successful")
  })

  res.setHeader("content-type","application/json")
  res.send(JSON.stringify("success"))
})

app.get("/logout",(req,res)=>{
  req.logout();
  res.redirect("/login");
});

app.listen(port, () => {
console.log(`App running on port ${port}.`)
})