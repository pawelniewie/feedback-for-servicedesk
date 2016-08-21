$(function () {
  AP.require(["events"], function (events) {
    var automation = new AP.jiraServiceDesk.Automation();

    automation.getConfig(function (config) {
      if (config) {
        $("#reply_to").val(config.replyTo);
        $("#reply_name").val(config.replyName);
      }
    });

    events.on("jira-servicedesk-automation-action-serialize", function () {
      automation.serialize({
        replyTo: $("#reply_to").val(),
        replyName: $("#reply_name").val()
      });
    });

    events.on("jira-servicedesk-automation-action-validate", function () {
      var valid = true;

      $('.error').remove();

      var $replyTo = $("#reply_to");
      if (!$replyTo.val()) {
        $replyTo.parent().append("<div class='error'>Reply to can't be empty</div>");
        valid = false;
      }

      var $replyName = $("#reply_name");
      if (!$replyName.val()) {
        $replyName.parent().append("<div class='error'>Reply name can't be empty</div>");
        valid = false;
      }

      automation.validate(valid);
    });
  });
});
