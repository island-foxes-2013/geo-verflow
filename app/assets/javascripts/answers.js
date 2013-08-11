// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var AnswerVotes = {
  init: function(selector){
    $(selector).on('ajax:success', this.vote);
  },

  vote: function(event, response, status, xhr) {
    var this_link = $(this);
    this_link.closest('ul').find('.answer_vote_number').text(response.votes);
  }
}

var QuestionVotes = {
  init: function(selector){
    $(selector).on('ajax:success', this.vote);
  },

  vote: function(event, response, status, xhr) {
    var this_link = $(this);
    $('.question_vote_number').text(response.votes);
  }

}

$(document).ready( function(){
  AnswerVotes.init('a.vote_up');
  AnswerVotes.init('a.vote_down');
  QuestionVotes.init('a.question_upvote');
  QuestionVotes.init('a.question_downvote');
});
