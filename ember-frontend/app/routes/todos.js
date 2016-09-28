import Ember from 'ember';

let todos = [
  {
    "id": "1",
    "inserted-at": "2016-09-28T15:02:23",
    "is-completed": true,
    "title": "Create the Phoenix App",
    "updated-at": "2016-09-28T15:02:23"
  },
  {
    "id": "2",
    "inserted-at": "2016-09-28T15:02:23",
    "is-completed": false,
    "title": "Prepare the Ember App",
    "updated-at": "2016-09-28T15:02:23"
  },
  {
    "id": "3",
    "inserted-at": "2016-09-28T15:02:23",
    "is-completed": false,
    "title": "Ensure the Apps Work Together",
    "updated-at": "2016-09-28T17:25:51"
  }
];

export default Ember.Route.extend({
  model() {
    //return this.get('store').findAll('todo');
    return todos;
  }
});
