# jQuery ->
#   Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
#   product.setupForm()

# product =
#   setupForm: ->
#     $('#new_product').submit ->
#       if $('input').length > 6
#         $('input[type=submit]').attr('disabled', true)
#         Stripe.bankAccount.createToken($('#new_product'), product.handleStripeResponse)
#         false

#   handleStripeResponse: (status, response) ->
#     if status == 200
#       $('#new_product').append($('<input type="hidden" name="stripeToken" />').val(response.id))
#       $('#new_product')[0].submit()
#     else
#       $('#stripe_error').text(response.error.message).show()
#       $('input[type=submit]').attr('disabled', false)

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()