const express = require('express')
const pug = require('pug')
const path = require('path')
const port = process.env.PORT | 8000;

const app = express()

app.set('view engine', 'pug')
app.use(express.static(path.join(__dirname, 'public')))

app.get("/", (req, res)=>{
    res.render("layout")
})

app.listen(port, ()=>{
    console.log(`Application running at http://localhost:${port}`)
})