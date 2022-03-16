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
          <v-row class="col-12">
          </v-row>
          <v-row class="col-12">
            <v-col class="col-6 text-center">
                <v-btn elevation="10" @click="button('eat')">Eat</v-btn>
            </v-col>
            <v-col class="col-6 text-center">
                <v-btn elevation="10" @click="button('sleep')">Sleep</v-btn>
            </v-col>
          </v-row>
          <v-row class="col-12">
            <v-col class="col-6 text-center">
                <v-btn elevation="10" @click="button('study')">Study</v-btn>
            </v-col>
            <v-col class="col-6 text-center">
                <v-btn elevation="10" @click="button('walk')">Walk</v-btn>
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
        button: function(message) {
            this.notify = true;
            this.text = message+ " now";
            console.log(message);
            axios.post('/b', {
                message: message
            })
            .then(function (response) {
              console.log(response);
            })
            .catch(function (error) {
              console.log("error");
              console.log(error);
            });
        },
      }
    })
  </script>
</body>
</html>
