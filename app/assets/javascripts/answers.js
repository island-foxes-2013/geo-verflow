// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var Votes = {
  init: function(selector){
    $(selector).on('ajax:success', this.vote);
  },

  vote: function(event, response, status, xhr) {
    console.log($(this));
    $(this).remove();
  }

}

$(function(){
  Votes.init('a.vote_up');
  Votes.init('a.vote_down');
});
