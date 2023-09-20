<?php

interface PaymentGatewayInterface {
  public function pay(int $amount);
}

class PayPal {
  public function sendPayment(float $amount) {
    // send payment by PayPal API
  }
}

class PayPalAdapter implements PaymentGatewayInterface {
  private $paypal;

  public function __construct(PayPal $paypal) {
    $this->paypal = $paypal;
  }

  public function pay(int $amount) {
    $this->paypal->sendPayment((float)$amount);
  }
}

class Stripe {
  public function pay(float $amount) {
    // send payment using Stripe API
  }
}

class StripeAdapter implements PaymentGatewayInterface {
  private $stripe;

  public function __construct(Stripe $stripe) {
    $this->stripe = $stripe;
  }

  public function pay(int $amount) {
    $this->stripe->pay((float)$amount);
  }
}

class GoPay {
  public function sendPaymentByAmountInCents(int $amount) {
    // send payment using GoPay API
  }
}

class GoPayAdapter implements PaymentGatewayInterface {
  public function __construct(private GoPay $gopay) { }

  public function pay(int $amount) {
    $this->gopay->sendPaymentByAmountInCents($amount);
  }
}

$stripe = new Stripe();
$stripeAdapter = new StripeAdapter($stripe);
$stripeAdapter->pay(123);

$paypalAdapter = new PayPalAdapter(new PayPal());
$paypalAdapter->pay(321);

$gopayAdapter = new GoPayAdapter(new GoPay());
$gopayAdapter->pay(10000);

