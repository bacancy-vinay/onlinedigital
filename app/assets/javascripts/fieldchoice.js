document.addEventListener("turbolinks:load", function(){
  
  var main = document.getElementById("fieldchoice_main_field");
  var sub= document.getElementById("fieldchoice_sub_field");
  $("#fieldchoice_main_field").on("change", function() {
    while (sub.firstChild) sub.removeChild(sub.firstChild);
        $.ajax({
          url: "/sub_fields/subfield?main=" + main.value,
          type: "GET"
        })
  });
    
})
