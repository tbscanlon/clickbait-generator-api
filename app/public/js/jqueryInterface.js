$( document ).ready(function () {
  $( "#generate-button" ).click(function () {
    $.get("/api", function (clickbait) {
      $( "#clickbait" ).html(clickbait.title);
      $( "#tweet" ).attr("href", "https://twitter.com/intent/tweet?text=" + clickbait.title)
    });

    $( "#clickbait-footer" ).html(sample(list));
  });
});
