<!DOCTYPE html>
<html>
<head>
  <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/@mdi/font@6.x/css/materialdesignicons.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
</head>
<body>
  <div id="app">
    <v-app>
      <v-main>

        <v-container>
          <v-row class="col-12 justify-center">
              <img :src="imagesrc" width=100>
          </v-row>
          <v-row class="col-12 justify-center">
              {% dt %}
          </v-row>
          <v-row class="col-12 justify-center">
              {% currentdt %}
          </v-row>
        </v-container>

      </v-main>
    </v-app>
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
        imagesrc: "",
        dt: "",
        currentdt: ""
      },
      methods: {
        hello: function() {
          update = this.update;
          axios.get('/json')
          .then(function (response) {
            //console.log("ok",response.data);
            dt = response.data.event[9].emoji_date + " " + response.data.event[9].emoji_time;
            currentdt = response.data.current_date + " " + response.data.current_time;
            emoji = response.data.event[9].emoji;
            if (emoji == "tired") {
                //console.log("is tired");
                update("/static/tired.png",dt,currentdt);
            } else if (emoji == "sad") {
                //console.log("is sad");
                update("/static/sad.png",dt,currentdt);
            } else if (emoji == "happy") {
                //console.log("is happy");
                update("/static/happy.png",dt,currentdt);
            }    
          })
          .catch(function (error) {
            // handle error
            console.log(error);
          });
        },
        update: function(text,dt,currentdt) {
            this.imagesrc = text;
            this.dt = dt;
            this.currentdt = currentdt;
        }
      },
      created: function() {
          this.hello();
          const myTimeout = setInterval(this.hello, 5000);
      }
    })
  </script>
</body>
</html>
