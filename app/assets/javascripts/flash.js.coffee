$ ->
  $(".flash").on("click", (event)->
    $(event.target).hide("slow")
  )
