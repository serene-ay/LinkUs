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
              <img src="/static/search.svg" width=100>
          </v-row>
          <v-row class="col-12">
            <v-col class="col-6 text-center">
                <v-btn elevation="10" @click="button('message','eat')">Eat</v-btn>
            </v-col>
            <v-col class="col-6 text-center">
                <v-btn elevation="10" @click="button('message','sleep')">Sleep</v-btn>
            </v-col>
          </v-row>
          <v-row class="col-12">
            <v-col class="col-6 text-center">
                <v-btn elevation="10" @click="button('message','study')">Study</v-btn>
            </v-col>
            <v-col class="col-6 text-center">
                <v-btn elevation="10" @click="button('message','walk')">Walk</v-btn>
            </v-col>
          </v-row>
          <hr>
          <v-row class="col-12">
            <v-col class="col-6 text-center">
                <v-btn elevation="10" @click="button('location','home')">Home</v-btn>
            </v-col>
            <v-col class="col-6 text-center">
                <v-btn elevation="10" @click="button('location','university')">University</v-btn>
            </v-col>
          </v-row>
          <v-row class="col-12">
            <v-col class="col-6 text-center">
                <v-btn elevation="10" @click="button('location','park')">Park</v-btn>
            </v-col>
            <v-col class="col-6 text-center">
                <v-btn elevation="10" @click="button('location','shop')">Shop</v-btn>
            </v-col>
          </v-row>
          <hr>
          <v-row class="col-12">
            <v-col class="col-4 text-center">
                <v-btn elevation="10" @click="button('emoji','happy')">Happy</v-btn>
            </v-col>
            <v-col class="col-4 text-center">
                <v-btn elevation="10" @click="button('emoji','sad')">Sad</v-btn>
            </v-col>
            <v-col class="col-4 text-center">
                <v-btn elevation="10" @click="button('emoji','tired')">Tired</v-btn>
            </v-col>
          </v-row>
        </v-container>

        <v-snackbar v-model="notify" class="text-center" :timeout=5000 >
              {% text  %}
        </v-snackbar>
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
