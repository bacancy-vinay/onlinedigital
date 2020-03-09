document.addEventListener("turbolinks:load", function () {
  var exp_country = document.getElementById("experience_country")
  var exp_state = document.getElementById("experience_state")
  
  $("#experience_country").on("change", function () {
    while (exp_state.firstChild) exp_state.removeChild(exp_state.firstChild);
    Rails.ajax({
      url: "/states/experience_state?country=" + exp_country.value,
      type: "GET"
    })
  })

  exp_state.addEventListener("change", function () {
    Rails.ajax({
      url: "/cities/experience_city?country=" + exp_country.value + "&state=" + exp_state.value,
      type: "GET"
    })
  })
})