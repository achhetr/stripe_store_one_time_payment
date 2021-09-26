class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def show
    current_user.set_payment_processor :stripe
    @checkout_session = current_user.payment_processor.checkout(
      mode: "payment",
      line_items: "price_1JdtnLGNbRL6fkngtP53ZOvh",
      success_url: root_url,
      cancel_url: root_url
    )
    redirect_to @checkout_session.url
  end
end
