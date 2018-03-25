jQuery(function($) {
  Stripe.setPublishableKey(gon.stripe_key);

  function createCardToken(event) {
   Stripe.card.createToken({
      number: $('#card_number').val(),
      cvc: $('#card-cvc').val(),
      exp_month: $('#card_month').val(),
      exp_year: $('#card_year').val()
    }, stripeResponseHandler);
    console.log('token created')
  }

  function stripeResponseHandler(status, response) {
    var $form = $('.add-card');

    if (response.error) {
      $("#error").text(response.error.message)
      $form.find("input[type=submit]").prop('disabled', false);
    } else {
      var token = response.id;
      console.log(token);
      $("input[id=stripe_temporary_token]").val(token)
      $form.get(0).submit();
    }
  };

 
  $('#card-unavailable').each(function() {
    $('.add-card').submit(function(event) {
      console.log('no card')
      createCardToken();
      return false;
    })
  })
});