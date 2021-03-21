<?php

namespace Drupal\currency\Form;

use Drupal\Core\Form\ConfigFormBase;
use Drupal\Core\Form\FormStateInterface;
use Drupal\Core\Datetime\DrupalDateTime;
/**
 * Configure ????? ????? settings for this site.
 */
class SettingsForm extends ConfigFormBase {

  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'currency_settings';
  }

  /**
   * {@inheritdoc}
   */
  protected function getEditableConfigNames() {
    return ['currency.settings'];
  }

  /**
   * {@inheritdoc}
   */
  public function get_array_of_currency() {
    $database = \Drupal::database();
    $nodes = $database->query("SELECT * FROM {currency} ORDER BY active DESC");
    return $nodes;
  }
  public function buildForm(array $form, FormStateInterface $form_state) {
    $nodes = $this->get_array_of_currency();
    $count = 1;
    foreach ($nodes as $node) {
      $dateUpdated = DrupalDateTime::createFromTimestamp($node->updated);
      if ($node->active) {$default_values[$count]=(int)($count);} else {$default_values[]=NULL;}
      $rows[$count] =['title' => $node->code,'rate'=>$node->rate,'updated'=>$dateUpdated->format('d.m.Y')];
      $count++;
    }
    $form['nodes'] = [   
      '#header' => [
        'title' => 'Код валюты',
        'rate' => 'Текущий курс',
        'updated' => 'Обновлено',
        'id' => '',
      ],
      '#options' => $rows,
      '#empty' => 'Empty...',
      '#type' => 'tableselect',
      '#default_value' =>$default_values,
      '#prefix'=>'<p>Выберите с помощью чекбокса валюты, доступные для обновления (нажмите "Сохранить" внизу страницы)</p>',
    ];
    
    $form['save'] = [
      '#type' => 'submit',
      '#value' => 'Сохранить',
    ];
 
    return $form;
  }

  /**
   * {@inheritdoc}
   */
  public function validateForm(array &$form, FormStateInterface $form_state) {
    $values = $form_state->getValues("nodes");
    $nodes = $this->get_array_of_currency();
    $all_currencies=$nodes->fetchAll();
    //обнуление активных валют
    $database = \Drupal::database();
    $result = $database->update('currency')
    ->fields([
      'active' => '0',
    ])
    ->execute();
    //активация списка выбранных валют/чекбоксов
    foreach($values["nodes"] as $value){
    if ($value != 0) {
      $checkedId = $all_currencies[$value-1]->id;
      $result = $database->update('currency')
      ->fields([
        'active' => 1,
      ])
      ->condition('id', $checkedId, '=')
      ->execute();
    }   
    }
    parent::validateForm($form, $form_state);
  }


}
