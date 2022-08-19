const app = new Vue({
  el: '#app',
  vuetify: new Vuetify(),
  data: () => ({
    show: false,
    takeout: '',
    putin: '',
    loadingTakeOut: false,
    loadingPutIn: false,
    cash: 0,
    name: ''
  }),

  methods: {
    OPEN(data) {
      this.show = true;
      this.cash = data.player.money;
    },
    CLOSE(data) {
      this.show = false;
      this.putin = '';
      this.takeout = '';
      post("https://jeppe_atmz/close", null);
    },
    TAKEOUT(data) {
      if (this.takeout >= 1) {
        this.loadingTakeOut = true;
        setTimeout(() => (this.loadingTakeOut = false, post("https://jeppe_atmz/withdrawz", JSON.stringify({
          amount: this.takeout
        }))), 2000)
      }
    },
    PUTIN(data) {
      if (this.putin >= 1) {
        this.loadingPutIn = true;
        setTimeout(() => (this.loadingPutIn = false, post("https://jeppe_atmz/depositz", JSON.stringify({
          amount: this.putin
        }))), 2000)
      }
    }
  },

  mounted() {
    this.escapeListener = window.addEventListener("keyup", (event) => {
      if (event.keyCode === 27) {
        this.CLOSE();
      }
    });
    this.messageListener = window.addEventListener("message", (event) => {
      const item = event.data || event.detail;
      if (this[item.type]) {
        this[item.type](item);
      }
    });
  },
})

window.post = (url, data) => {
  var request = new XMLHttpRequest();
  request.open("POST", url, true);
  request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
  request.send(data);
};
