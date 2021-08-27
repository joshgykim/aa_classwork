class Clock {
    constructor() {
        this.date = new Date();
        this.hour = this.date.getHours();
        this.minute = this.date.getMinutes();
        this.second = this.date.getSeconds();

        this.printTime();

        setInterval(this._tick.bind(this), 1000);

      // 1. Create a Date object.
      // 2. Store the hours, minutes, and seconds.
      // 3. Call printTime.
      // 4. Schedule the tick at 1 second intervals.
    }
  
    printTime() {

      const toString = (time) => (time >= 10 ? `${time}` : `0${time}`);
      let timeString = toString(this.hour)+ ":" +
                       toString(this.minute) + ":" +
                       toString(this.second);

      console.log(timeString);
    }
  
    _tick() {
      // 1. Increment the time by one second.
      // 2. Call printTime.
      this.second++;
      if (this.second/60 >= 1) {
          this.minute++;
          this.second -= 60;
          if (this.minute/60 >= 1) {
              this.hour++;
              this.minute -= 60;
          }
      }
      this.hour = this.hour % 24;

      this.printTime();
    }
}
  
const clock = new Clock();
