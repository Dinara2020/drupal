<?php
namespace Drupal\currency\Form;

use Drupal\Core\Form\ConfigFormBase;
use Drupal\Core\Form\FormStateInterface;
use Drupal\Core\Datetime\DrupalDateTime;

/**
 * Provides a calculator form.
 */
class CalculatorForm extends ConfigFormBase {

  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'calculator_example';
  }
  /**
   * {@inheritdoc}
   */
  protected function getEditableConfigNames() {
    return ['calculator.example'];
  }
  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {

    $form['amount'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Количество'),
      '#required' => TRUE,
      '#suffix'=>'Сумма конвертации'
    ];
    $database = \Drupal::database();
    $nodes = $database->query("SELECT code FROM {currency} WHERE active =1");
    $codes=$nodes->fetchAll();
    $i = 1;
    foreach ($codes as $code) {
      $options[$code->code] = $code->code;
    }
    $form['first_currency'] = [
      '#type' => 'select',
      '#title' => 'Выберите валюту для конвертации',
      '#options' => $options
    ];
    $form['second_currency'] = [
      '#type' => 'select',
      '#title' => 'Выберите валюту в которую конвертируем',
      '#options' => $options
    ];
    $form['actions']['submit'] = [
      '#type' => 'submit',
      '#value' => 'Конвертировать',
    ];

    return $form;
  }

  /**
   * {@inheritdoc}
   */
  public function validateForm(array &$form, FormStateInterface $form_state) {
//
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    $result = $form_state->getValues("values");
    $convert = new \Drupal\currency\Controller\CurrencyController();
    $convert_amount = $convert->converter($result["amount"],$result["first_currency"],$result["second_currency"]);
    $this->messenger()->addStatus($this->t('Сумма конвертации из '.$result["first_currency"]." в ".$result["second_currency"]." составляет - ". $convert_amount));
    $form_state->setRedirect('currency.example');
  }

}
