$(function() {
  var tablerButtonInputBinding = new Shiny.InputBinding();
  $.extend(tablerButtonInputBinding, {
    find: function(scope) {
      // your code
    },
    getValue: function(el) {
      // your code
    },
    setValue: function(el, value) {
      // your code
    },
    receiveMessage: function(el, data) {
      // your code
    },
    subscribe: function(el, callback) {
      // your code
    },
    unsubscribe: function(el) {
      $(el).off(".tablerButtonInputBinding");
    }
  });
  
  // registration
  Shiny.inputBindings.register(tablerButtonInputBinding, 'shiny.tablerButtonInput');
  
  
  $(document).on('click', 'a.tabler-button', function(e) {
    e.preventDefault();
  });
});