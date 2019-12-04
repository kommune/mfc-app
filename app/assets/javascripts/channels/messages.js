$(document).on('turbolinks:load', function () {
App.messages = App.cable.subscriptions.create({
  channel: 'MessagesChannel', message_board_id: parseInt($("#message_message_board_id").val())
},
{
  received: function (data) {
    $("#messages").removeClass('hidden')
    return $('#messages').append(this.renderMessage(data));
  },
  renderMessage: function (data) {
      return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
    },
  });
})
