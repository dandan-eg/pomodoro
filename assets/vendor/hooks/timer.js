function formatTime(timeInSecond) {
  const minutes = Math.floor(timeInSecond / 60);
  const seconds = timeInSecond % 60;

  if (minutes >= 10) {
    if (seconds >= 10) {
      return `${minutes}:${seconds}`
    } else {
      return `${minutes}:0${seconds}`
    }
  } else {
    if (seconds >= 10) {
      return `0${minutes}:${seconds}`
    } else {
      return `0${minutes}:0${seconds}`
    }
  }
}

/* 
 * Hooks to decrement a timer every second.
 *
 * Must be use with attributes:
 * - data-start-time: system time in seconds
 * - data-duration: duration of the timer
 */
const Timer = {
  tick() {
    const now = Math.round(new Date() / 1000);
    const elapsed = now - this.el.dataset.startTime;
    const remaining = this.el.dataset.duration - elapsed;
    if (remaining >= 0) {
      this.el.textContent = formatTime(remaining);
    } else {
      this.stop();
    }
  },

  start() {
    // force to run the first tick now not in 1 seconds
    this.tick();
    this.interval = setInterval(() => this.tick(), 1000)
  },

  stop() {
    if (this.interval) {
      clearInterval(this.interval);
      this.interval = null;
    }
  },

  mounted() {
    this.start();
  },

  updated() {
    // restart
    this.stop();
    this.start();
  },

  destroyed() {
    this.stop();
  }
};

export { Timer }
