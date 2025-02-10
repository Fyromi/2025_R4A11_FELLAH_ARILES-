class CounterModel {

  int counter = 0;

  void decrementCounter(){
      this.counter--;
  }

  void incrementCounter() {
      this.counter++;
  }

  int getCounter(){
    return this.counter;
  }
}