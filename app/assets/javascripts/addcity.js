document.addEventListener("turbolinks:load", function () { 
  var country = document.getElementById("address_country");
  var state = document.getElementById("address_state");
  
  $("#address_country").on("change", function () {
    while (state.firstChild) state.removeChild(state.firstChild);
    Rails.ajax({
      url: "/states/address_state?country=" + country.value,
      type: "GET"
    })
  })

  state.addEventListener("change", function () {
    Rails.ajax({
      url: "/cities/address_city?country=" + country.value + "&state=" + state.value,
      type: "GET"
    })
  })
})