// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var AnswerVotes = {
  init: function(selector, wrapper){
    $(selector).on('ajax:success', this.vote);
  },

  vote: function(event, response, status, xhr) {
    var this_link = $(this);
    this_link.closest('ul').find('.votes strong').text(response.votes);
  }
}

var QuestionVotes = {
  init: function(selector){
    $(selector).on('ajax:success', this.vote);
  },

  vote: function(event, response, status, xhr) {
    var this_link = $(this);
    this_link.closest('ul').find('.q_votes strong').text(response.votes);
  }

}

$(document).ready( function(){
  AnswerVotes.init('a.vote_up');
  AnswerVotes.init('a.vote_down');
  QuestionVotes.init('a.question_upvote');
  QuestionVotes.init('a.question_downvote');
});
