document.addEventListener("turbolinks:load", function(){
  var country = document.getElementById("address_country");
  var state = document.getElementById("address_state");

  country.addEventListener("change", function(){
    while (state.firstChild) state.removeChild(state.firstChild);
    Rails.ajax({
      url: "/states?country=" + country.value,
      type: "GET"
    })
  })

  state.addEventListener("change", function(){
    Rails.ajax({
      url: "/cities?country=" + country.value + "&state=" + state.value,
      type: "GET"
    })
  })
})