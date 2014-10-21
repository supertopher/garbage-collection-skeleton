$(function() {
  $(".named-link").on("click", function(event){
    event.preventDefault()
    $.ajax({
      url: "/cats"
    }).done(function(data){
      $(".all-the-things").html(data)
    })
  })


  $(".all-the-things").on("click", (".brownbatlink"), function(event){
    event.preventDefault()
    alert("we bound that stuff. fo sho")
  })
});