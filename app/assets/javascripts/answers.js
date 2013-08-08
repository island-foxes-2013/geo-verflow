// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var Votes = {
  init: function(selector){
    $(selector).on('ajax:success', this.vote);
  },

  vote: function(event, response, status, xhr) {
    var this_link = $(this);
    this_link.closest('ul').find('.votes strong').text(response.votes);
    this_link.remove();
  }

}

$(function(){
  Votes.init('a.vote_up');
  Votes.init('a.vote_down');
});
