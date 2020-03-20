document.addEventListener("turbolinks:load", function () {
  var edu_country = document.getElementById("education_country")
  var edu_state = document.getElementById("education_state")
  
  $("#education_country").on("change", function () {
    while (edu_state.firstChild) edu_state.removeChild(edu_state.firstChild);
    Rails.ajax({
      url: "/states/education_state?country=" + edu_country.value,
      type: "GET"
    })
  })

  edu_state.addEventListener("change", function () {
    Rails.ajax({
      url: "/cities/education_city?country=" + edu_country.value + "&state=" + edu_state.value,
      type: "GET"
    })
  })
})