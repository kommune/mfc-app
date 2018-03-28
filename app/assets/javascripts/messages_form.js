$(document).on("turbolinks:load", function () {
  var shiftDown = false;
  var messageBoardForm = $("#new_message");
  var messageBox = messageBoardForm.children("textarea");
  $(document).keypress(function (e) {
    if(e.keyCode == 13) {
      if(messageBox.is(":focus") && !shiftDown) {
        e.preventDefault();
        messageBoardForm.submit();
        $(messageBoardForm).trigger('reset');
      }
    }
  });
  $(document).keyup(function (e) {
    if(e.keyCode == 16) shiftDown = true;
  });

  $(document).keyup(function (e) {
    if(e.keyCode == 16) shiftDown = false;
  });

  $(".scroll").scrollTop($(".scroll")[0].scrollHeight);
})
