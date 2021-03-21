<?php

namespace Drupal\currency\Controller;

use Drupal\Core\Controller\ControllerBase;
use Drupal\Core\Form\FormState;

/**
 * Returns responses for currency routes.
 */
class CurrencyController extends ControllerBase {
  const CUR_LINK = "http://data.fixer.io/api/latest?access_key=";
  const ACCESS_KEY = "69d7a9a7696fcf862f7d16637935fef9";
  /**
   * Builds the response.
   */
  public function build() {
    $expires = \Drupal::state()->get('currency.last_check', 60);
    var_dump($expires);die;
  $form_state = new FormState();
  $form = \Drupal::formBuilder()->buildForm('Drupal\currency\Form\CalculatorForm', $form_state);
	return $form;
  }
  public function add_currencies() {
    $database = \Drupal::database();
	  $values = json_decode(file_get_contents(self::CUR_LINK.self::ACCESS_KEY),true);
    foreach ($values['rates'] as $key => $value) {
      $result = $database->insert('currency')
        ->fields([
          'code' =>$key,
          'value' => $value,
          'updated' => \Drupal::time()->getRequestTime(),
        ])
  ->execute();
    }
    
  }
  public function update_currencies() {
    $database = \Drupal::database();
    $values = json_decode(file_get_contents(self::CUR_LINK.self::ACCESS_KEY),true);
    foreach ($values['rates'] as $key => $value) {
      $result = $database->update('currency')
        ->fields([
          'rate' => $value,
          'updated' => \Drupal::time()->getRequestTime(),
        ])
        ->condition('code', $key, '=')
        ->execute();
    }

  }
  public function converter($amount,$cur1,$cur2) {
   $database = \Drupal::database();
    $first_value = $database->select('currency','cur')
    ->fields('cur',['rate'])
    ->condition('code', $cur2, '=')
    ->execute()
    ->fetchField();
    $second_value = $database->select('currency','cur')
    ->fields('cur',['rate'])
    ->condition('code', $cur1, '=')
    ->execute()
    ->fetchField();
    $result = $first_value/$second_value*$amount;
    return $result;
  }
 
// 
function mymodule_menu() {
  $form_state = new FormState();
  $form = \Drupal::formBuilder()->buildForm('Drupal\currency\Form\SettingsForm', $form_state);
	return $form;
}
}
