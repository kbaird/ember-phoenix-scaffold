import DS from 'ember-data';

var Todo = DS.Model.extend({
  title:       DS.attr('string'),
  insertedAt:  DS.attr('date'),
  updatedAt:   DS.attr('date'),
  isCompleted: DS.attr('boolean', { defaultValue: false })
});

Todo.reopenClass({
  FIXTURES: [
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
  ]
});

export default Todo;
