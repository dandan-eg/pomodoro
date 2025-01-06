
export const Countdown = {
  //Callbacks:
  mounted() {
    this.initializeNewTimer()
  },
  updated() {
    this.initializeNewTimer()
  },
  destroyed() {
    this.clearTimer()
  },


  //Helpers:
  startTimeInSeconds() {
    return parseInt(this.el.dataset.startTime, 10);
  },

  durationInSeconds() {
    return parseInt(this.el.dataset.duration, 10);
  },

  initializeNewTimer() {
    // clear previous timer 
    this.clearTimer()

    // don't wait 1000ms before the first tick
    this.tick();
    this.interval = setInterval(() => {
      this.tick()
    }, 1000)
  },

  tick() {
    const start = this.startTimeInSeconds();
    const now = Math.floor(Date.now() / 1000);
    const elapsed = now - start;
    const remaining = this.durationInSeconds() - elapsed;

    this.updateTextContent(remaining);
    if (remaining <= 0) {
      this.clearTimer();
    }
  },

  updateTextContent(timeRemainingInSeconds) {
    const minutes = Math.floor(timeRemainingInSeconds / 60);
    const seconds = timeRemainingInSeconds % 60;

    let formatted;
    if (minutes >= 10) {
      if (seconds >= 10) {
        formatted = `${minutes}:${seconds}`
      } else {
        formatted = `${minutes}:0${seconds}`
      }
    } else {
      if (seconds >= 10) {
        formatted = `0${minutes}:${seconds}`
      } else {
        formatted = `0${minutes}:0${seconds}`
      }
    }

    this.el.textContent = formatted;
  },

  clearTimer() {
    if (this.interval) {
      clearInterval(this.interval);
      this.interval = null;
    }
  }
}

