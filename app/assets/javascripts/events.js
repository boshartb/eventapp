$(document).on('ready page:load', function() {
  if ($("body.events").length) {
    if ($('.pagination').length) {
      console.log("found pagination div")

      $(window).scroll(function() {
        console.log("inside window scoll")
        var url = $(".pagination li a[rel='next']").attr('href');
        if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
          $('.pagination').text("Fetching more events...");
          return $.getScript(url);
        }
      });
    }
  }
});