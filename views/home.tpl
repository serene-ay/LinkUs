<!DOCTYPE html>
<html>
<head>
  <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/@mdi/font@6.x/css/materialdesignicons.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LinkUs</title>
  <style>
            *{
        box-sizing: border-box;
        padding: 0;
        margin: 0;
        }

        h1{
            font-size: 30px;
            text-align: center;
            margin-top: 10px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin-bottom: 10px;
        }
        h3{
            font-size: 20px;
            text-align: center;
            margin-top: 0px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin-bottom: 15px;
        }
        .back-image{

            height: 370px;
            display: flex;
            background-size: cover;
            margin-bottom: -30px;
            box-shadow: 0 0 11px rgba(33,33,33,.2);
            border-bottom-left-radius: 30px;
            border-bottom-right-radius: 30px;

          }

        .location{
            background-image: url('/01_Location/location.png');
            box-shadow: 0 0 11px rgba(33,33,33,.2);
        }
        .all-cards{

        justify-content: center;
        padding-top: 10px;
        padding-bottom: 20px;
        box-shadow: 0 0 11px rgba(33,33,33,.2);
        margin-left:30px ;
        margin-right: 30px;
        margin-top: 20px;
        margin-bottom: auto;
        border-radius: 20px;
        }
        .container{
            display: flex;
            justify-content: center;

        }

        .card{
            background: white;
            width: 120px;
            height: 100px;
            margin: 10px;
            border-radius: 10px;
            text-decoration: none;
            box-shadow: 0 0 11px rgba(33,33,33,.2);
        }

        .card1{
            background: white;
            width: 50px;
            height: 50px;
            margin: 10px;
            border-radius: 10px;
            text-decoration: none;
            box-shadow: 0 0 11px rgba(33,33,33,.2);
        }
        .card-image {
            height: 80px;
            margin-bottom: 0;
            background-size: cover;

        }
        .card-image1 {
            height: 50px;
            margin-bottom: 0;
            background-size: cover;

        }
        .home{
            background-image: url('/static/home.png');
        }
        .university{
            background-image: url('/static/university.png');
        }
        .shop{
            background-image: url('/static/shop.jpg');
        }
        .park{
            background-image: url('/static/park.jpg');
        }
        .study{
            background-image: url('/static/study.jpg');
        }
        .eat{
            background-image: url('/static/eating.jpeg');
        }
        .sleep{
            background-image: url('/static/sleeping.png');
        }
        .errand{
            background-image: url('/static/errands.jpg');
        }
        .sad{
            background-image: url('/static/sad.png');
        }
        .angry{
            background-image: url('/static/angry.png');
        }
        .happy{
            background-image: url('/static/happy.png');
        }
        .tired{
            background-image: url('/static/tired.png');
        }

        .card h2{
            font-size: 20px;
            font-family: sans-serif;
            text-align: left;
            margin-top: -4px;
            margin-left: 18px;
        }

        .card:active{
            box-shadow: 0 0 11px rgba(33,33,33,.2);
            border: solid rebeccapurple;
            transform: scale(1.05);
            cursor: pointer;
        }

    </style>
</head>
<body>
  <div id="app">
    <H1>LinkUs</H1>
    <div class="all-cards">
        <h3>Select Location</h3>
        <section class="container">
            <div class="card" @click="button('location','home')">
                <div class="card-image home" >
                </div>
                <h2>Home</h2>
            </div>
            <div class="card" @click="button('location','university')">
                <div class="card-image university" >
                </div>
                <h2>University</h2>
            </div>
        </section>
        <section class="container">
            <div class="card" @click="button('location','shop')">
                <div class="card-image shop" >
                </div>
                <h2>Shop</h2>
            </div>
            <div class="card" @click="button('location','park')">
                <div class="card-image park">
                </div>
                <h2>Park</h2>
            </div>
        </section>
    </div>
    <div class="all-cards">
        <h3>Select Activity</h3>
        <section class="container">
            <div class="card" @click="button('message','study')">
                <div class="card-image study">
		        </div>
                <h2>Studying</h2>
            </div>
            <div class="card" @click="button('message','eat')">
                <div class="card-image eat">
		        </div>
                <h2>Eating</h2>
            </div>
        </section>
        <section class="container">
            <div class="card" @click="button('message','sleep')">
                <div class="card-image sleep">
		        </div>
                <h2>Sleeping</h2>
            </div>
            <div class="card" @click="button('message','walk')">
                <div class="card-image errand">
		        </div>
                <h2>Walking</h2>
            </div>
        </section>
    </div>
    <div class="all-cards">
        <section class="container">
            <a href="" class="card1">
                <div class="card-image1 sad" @click="button('emoji','sad')">
                </div>
            </a>
            <a href="" class="card1">
                <div class="card-image1 angry" @click="button('emoji','angry')">
                </div>
            </a>
            <a href="" class="card1">
                <div class="card-image1 tired" @click="button('emoji','tired')">
                </div>
            </a>
            <a href="" class="card1">
                <div class="card-image1 happy" @click="button('emoji','happy')">
                </div>
            </a>
        </section>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <script>
    new Vue({
      el: '#app',
      delimiters: ['{%', '%}'],
      vuetify: new Vuetify(),
      data: {
        notify: false,
        b1: "Button 1",
        text: `Hello, I'm a notify`,
      },
      methods: {
        button: function(type,info) {
            console.log(type,info);
            ack = this.ack;
            axios.post('/b/'+type, {
                info: info
            })
            .then(function (response) {
                console.log(response);
                ack(info+" now");
            })
            .catch(function (error) {
                console.log("error");
                console.log(error);
            });
        },
            ack: function(msg) {
            console.log("ack");
            this.text = msg;
            this.notify = true;
        }
      }
    })
  </script>
</body>
</html>
